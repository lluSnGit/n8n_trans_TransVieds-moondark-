const fs = require('fs');

try {
  const jsonContent = fs.readFileSync('n8n.json', 'utf8');
  JSON.parse(jsonContent);
  console.log('✅ JSON语法检查通过');
} catch (error) {
  console.log('❌ JSON语法错误:', error.message);
} 