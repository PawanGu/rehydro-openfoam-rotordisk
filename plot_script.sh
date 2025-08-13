python3 - <<'PY'
import pandas as pd, matplotlib.pyplot as plt
df = pd.read_csv('power_vs_rpm.csv')
plt.plot(df['rpm'], -df['EffectivePower_W'], marker='o')
plt.xlabel('rpm')
plt.ylabel('Shaft power (W)  ~  -Effective power')
plt.title('Turbine power vs rpm (U fixed)')
plt.grid(True)
plt.tight_layout()
plt.savefig('power_vs_rpm.png', dpi=160)
print(df)
PY
