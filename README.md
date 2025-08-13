# ReHydro — OpenFOAM rotorDisk

Actuator-disk (rotorDisk) study for a small hydro turbine (OpenFOAM v10).
Includes baseline case, sweeps (power vs rpm),
and simple plotting.

## Quick start
```bash
./rotor_rpm.sh
simpleFoam > log.baseline 2>&1
