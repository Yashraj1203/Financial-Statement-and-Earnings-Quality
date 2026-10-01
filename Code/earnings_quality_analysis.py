import pandas as pd

df = pd.read_csv("../Data/Asian_Paints_Consolidated_Historical.csv").set_index("Metric")
revenue = df.loc["Revenue from sale of products/services (₹ cr)"]
ebitda = df.loc["EBITDA (₹ cr)"]
pat = df.loc["PAT (₹ cr)"]
cfo = df.loc["Net CFO (₹ cr)"]

analysis = pd.DataFrame({
    "Revenue": revenue,
    "EBITDA": ebitda,
    "PAT": pat,
    "CFO": cfo,
})
analysis["Revenue Growth"] = analysis["Revenue"].pct_change()
analysis["EBITDA Margin"] = analysis["EBITDA"] / analysis["Revenue"]
analysis["PAT Margin"] = analysis["PAT"] / analysis["Revenue"]
analysis["CFO/PAT"] = analysis["CFO"] / analysis["PAT"]

print(analysis.round(3))
