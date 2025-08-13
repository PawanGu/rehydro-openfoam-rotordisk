# ReHydro — OpenFOAM rotorDisk

Actuator-disk (rotorDisk) study for a small hydro turbine (OpenFOAM v10).
Includes baseline case, sweeps (power vs rpm),
and simple plotting.

## Quick start
```bash
cd cases/rotorDisk
simpleFoam > log.baseline 2>&1
