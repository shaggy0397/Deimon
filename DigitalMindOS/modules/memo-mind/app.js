if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('./sw.js');
}

function dictar() {
  const recogedor = new webkitSpeechRecognition();
  recogedor.lang = 'es-MX';
  recogedor.onresult = e => {
    document.getElementById('notas').value += e.results[0][0].transcript + '\n';
  };
  recogedor.start();
}

function capturar() {
  html2canvas(document.body).then(canvas => {
    let link = document.createElement('a');
    link.download = 'captura.png';
    link.href = canvas.toDataURL();
    link.click();
  });
}

function grabar() {
  alert('🔴 Grabación activada (simulada)');
}

function analizar() {
  const texto = document.getElementById('notas').value;
  alert('🤖 SHAGGY analizando: ' + texto);
  // Aquí iría la llamada real a Gemini o API externa
}
