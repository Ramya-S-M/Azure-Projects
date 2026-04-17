const http = require('http');
const port = process.env.PORT || 3000;

// These come from Azure App Settings.
// DB_CONNECTION_STRING is resolved from Key Vault automatically.
const dbConn = process.env.DB_CONNECTION_STRING || 'NOT LOADED';
const appEnv = process.env.APP_ENV || 'unknown';
const appLabel = process.env.APP_NAME_LABEL || 'My App';

const html = `
<!DOCTYPE html>
<html>
<head>
  <title>Key Vault Demo</title>
  <style>
    body{font-family:Arial,sans-serif;max-width:700px;margin:60px auto;padding:20px;background:#f5f5f5;}
    .card{background:white;border-radius:12px;padding:30px;box-shadow:0 2px 8px rgba(0,0,0,0.1);}
    h1{color:#0078d4;margin-top:0;}
    .badge{display:inline-block;padding:4px 12px;border-radius:20px;font-size:13px;font-weight:bold;}
    .green{background:#d4edda;color:#155724;}
    .red{background:#f8d7da;color:#721c24;}
    .row{display:flex;justify-content:space-between;padding:12px 0;border-bottom:1px solid #eee;}
    .row:last-child{border:none;}
    .label{color:#666;font-size:14px;}
    .value{font-weight:bold;font-size:14px;max-width:400px;word-break:break-all;}
  </style>
</head>
<body>
  <div class="card">
    <h1>Azure Managed Identity + Key Vault Demo</h1>
    <p>Built by <strong>Ramya</strong> - secrets loaded from Key Vault, zero passwords in code.</p>
    <div class="row">
      <span class="label">App</span>
      <span class="value">${appLabel}</span>
    </div>
    <div class="row">
      <span class="label">Environment</span>
      <span class="value">${appEnv}</span>
    </div>
    <div class="row">
      <span class="label">Key Vault Secret</span>
      <span class="value">
        <span class="${dbConn !== 'NOT LOADED' ? 'badge green' : 'badge red'}">
          ${dbConn !== 'NOT LOADED' ? 'LOADED FROM KEY VAULT' : 'NOT LOADED - check setup'}
        </span>
      </span>
    </div>
    <div class="row">
      <span class="label">Secret preview</span>
      <span class="value">${dbConn !== 'NOT LOADED' ? dbConn.substring(0, 40) + '...' : 'N/A'}</span>
    </div>
    <div class="row">
      <span class="label">Node.js version</span>
      <span class="value">${process.version}</span>
    </div>
  </div>
</body></html>`;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  res.end(html);
});

server.listen(port, () => {
  console.log(`Server on port ${port}`);
  console.log(`Secret loaded: ${dbConn !== 'NOT LOADED' ? 'YES' : 'NO'}`);
});
