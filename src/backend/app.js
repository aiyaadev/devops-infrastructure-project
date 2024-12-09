const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.json({ message: 'Backend Service Running' });
});

app.get('/health', (req, res) => {
  res.json({ status: 'healthy' });
});

app.get('/api/data', (req, res) => {
  res.json({
    data: 'Sample backend data',
    timestamp: new Date().toISOString()
  });
});

app.listen(port, () => {
  console.log(`Backend app listening on port ${port}`);
});