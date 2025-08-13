# Environment & Repro Guide

This project is a small, reproducible **OpenFOAM v10** mini-study (actuator-disk / `rotorDisk`) with bash/Python sweeps and simple plots.

---

## Tested setup

- **OS:** Linux (inside container), host macOS
- **OpenFOAM:** v10 (Foundation build)
- **Compiler/toolchain:** GCC (container default)
- **ParaView:** 5.x (for visualization)
- **Python:** 3.9+ with `pandas`, `matplotlib`  
  → install via `pip install -r requirements.txt`

> If your OpenFOAM is v9/v11, it will likely work—names of some functionObjects can differ (see Troubleshooting).

---

## Get OpenFOAM running

### Option A — Container (recommended, cross-platform)
Any OpenFOAM v10 container is fine. Inside the container:
```bash
# (typical) enable OpenFOAM in the shell
source /opt/openfoam10/etc/bashrc
foamVersion
