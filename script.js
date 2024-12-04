const matricula = "432126";
const baseApiUrl = "http://localhost/meu_site/api.php";

// Evento para gerar QR Code e salvar log
document.getElementById('generateBtn').addEventListener('click', async function () {
    const textInput = document.getElementById('textInput').value;
    const size = document.getElementById('sizeSelect').value;

    if (textInput.trim() === "") {
        alert("Por favor, insira um texto ou URL para gerar o QR Code.");
        return;
    }

    // Gera o QR Code
    const qrUrl = `https://api.qrserver.com/v1/create-qr-code/?data=${encodeURIComponent(textInput)}&size=${size}`;
    document.getElementById('qrCode').innerHTML = `<img src="${qrUrl}" alt="QR Code">`;

    // Salva o log no banco de dados
    const log = {
        metodo: "QR Code",
        resultado: `Gerado com sucesso para "${textInput}"`,
        tamanho: size,
        usuario: matricula,
    };

    try {
        const response = await fetch(baseApiUrl, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(log),
        });
        const result = await response.json();
        console.log("Log salvo no banco de dados:", result);

        if (result.id) {
            showLogs();
        }
    } catch (error) {
        console.error("Erro ao salvar log:", error);
    }
});

// Função para buscar e exibir logs no modal
async function showLogs() {
    const logsList = document.getElementById('logsList');
    logsList.innerHTML = ''; // Limpa a lista antes de renderizar os logs

    try {
        const response = await fetch(baseApiUrl);
        const logs = await response.json();

        if (Array.isArray(logs)) {
            logs.forEach(log => {
                const logEntry = document.createElement('p');
                logEntry.innerHTML = `
                    Log ID: ${log.id}, Método: ${log.metodo}, Resultado: ${log.resultado}, Tamanho: ${log.tamanho}
                    <button onclick="deleteLog(${log.id})">Excluir</button>
                `;
                logsList.appendChild(logEntry);
            });
        } else {
            logsList.innerHTML = `<p>Nenhum log encontrado.</p>`;
        }

        // Exibe o modal de logs
        document.getElementById('logModal').style.display = 'block';
        document.getElementById('overlay').style.display = 'block';
    } catch (error) {
        console.error("Erro ao buscar logs:", error);
    }
}

// Função para deletar um log
async function deleteLog(idLog) {
    try {
        const deleteUrl = `${baseApiUrl}?id=${idLog}`;
        const response = await fetch(deleteUrl, {
            method: "DELETE",
        });
        const result = await response.json();
        alert(result.message);

        showLogs();
    } catch (error) {
        console.error("Erro ao excluir log:", error);
    }
}

// Fecha o modal de logs
function closeLogModal() {
    document.getElementById('logModal').style.display = 'none';
    document.getElementById('overlay').style.display = 'none';
}

// Botão para exibir logs
document.getElementById('showLogsBtn').addEventListener('click', showLogs);