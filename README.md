# ReHydro — OpenFOAM rotorDisk

Actuator-disk (rotorDisk) study for a small hydro turbine (OpenFOAM v10).
Includes baseline case, sweeps (power vs rpm),
and simple plotting.

## Quick start
```bash
# (one-time) make helper scripts executable
chmod +x rotor_rpm.sh plot_script.sh

# 1) Run the rpm sweep at fixed inlet speed (U). 
#    - Uses the rotorDisk case from OpenFOAM
#    - Writes a CSV as power_vs_rpm.csv
#    - You can edit U, R, and the RPM list at the top of rotor_rpm.sh
./rotor_rpm.sh

# 2) Generate the plot from the CSV produced above.
#    - Reads power_vs_rpm.csv
#    - Saves power_vs_rpm.png
./plot_script.sh
```

## Results

*Figure 1.* Shaft power (−Effective power) vs rpm at fixed inlet speed **U = 1 m/s**.  
![Power vs rpm](./results/power_vs_rpm.png)
*Figure 2.* velocity vector along the flow, entire cycliner   
![velocity vector along the flow, entire cycliner](./results/velocity_flow.png)
*Figure 3.* U magnitude on the crossection of middle cycliner
![U magnitude on the crossection](./results/U_magnitude_view.png)
