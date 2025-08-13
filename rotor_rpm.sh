# --- config ---
U=1.0                       # m/s (fixed)
RPM_LIST=(100 200 300 400 500 600)

# fix inlet speed via your Uinlet alias
foamDictionary 0/U -entry Uinlet -set "(0 ${U} 0)"

# CSV header
: > power_vs_rpm.csv
echo "rpm,omega_rad_s,lambda,EffectivePower_W,ShaftPower_W" >> power_vs_rpm.csv

for rpm in "${RPM_LIST[@]}"; do
  # set rpm inside fvModels (try both common paths)
  foamDictionary constant/fvModels -entry "disk/rpm" -set $rpm \
  || foamDictionary constant/fvModels -entry "disk/rpm" -set $rpm

  # clean times & run
  rm -rf postProcessing [1-9]* 2>/dev/null
  simpleFoam > "log.rpm${rpm}" 2>&1

  # grab last Effective power from actuator-disk report
  L=$(grep -n "rotorDisk output" "log.rpm${rpm}" | tail -1 | cut -d: -f1)
  Peff=$(sed -n "$L,$((L+10))p" "log.rpm${rpm}" | awk '/Effective power/{print $NF}')
  # derived
  omega=$(awk -v r=$rpm 'BEGIN{print r*2*3.141592653589793/60.0}')
  # if you know R, add TSR; otherwise leave blank
  R=0.25  # <-- set your disk radius (m) from rotatingZone bounds
  lam=$(awk -v om=$omega -v R=$R -v U=$U 'BEGIN{print om*R/U}')
  printf "%g,%.6f,%.6f,%.8f,%.8f\n" "$rpm" "$omega" "$lam" "$Peff" "$(awk -v p="$Peff" 'BEGIN{print -p}')" >> power_vs_rpm.csv
done
