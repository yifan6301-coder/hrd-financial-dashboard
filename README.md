# HRD Financial Dashboard

Internal financial dashboard for Health Reach Diagnostics (健达检测).

Single-file HTML app (`hrd-dashboard.html`) with:

- Role-based login (Cashier / Receivables / Admin)
- Revenue analytics (by branch, week, service line)
- Expense classification (Fixed / Variable Ops / Capex / Marketing / Admin) with business-model metrics
- Daily reconciliation across Revenue Dashboard / Bank / M-Pesa / Cash / HMIS
- PDF/CSV/XLSX statement parsing for Equity Bank, M-Pesa, HMIS
- Monthly / weekly / daily reports + CSV export

## Running locally

```bash
python3 -m http.server 8000
open http://localhost:8000/hrd-dashboard.html
```

Or just double-click `hrd-dashboard.html` to open it directly in Chrome.

## Security note

Client-side password protection is suitable for internal team use only.
It prevents casual access but is not cryptographically secure.
Do not store highly sensitive data beyond what is needed for daily reconciliation.
