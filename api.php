<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET, POST, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

$conn = new mysqli("localhost", "root", "", "app_logs");

if ($conn->connect_error) {
    die(json_encode(["error" => "Falha na conexão: " . $conn->connect_error]));
}

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case "POST":
        $data = json_decode(file_get_contents("php://input"), true);
        $stmt = $conn->prepare("INSERT INTO logs (metodo, resultado, usuario) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $data['metodo'], $data['resultado'], $data['usuario']);
        $stmt->execute();
        echo json_encode(["id" => $stmt->insert_id]);
        break;

    case "GET":
        $result = $conn->query("SELECT * FROM logs ORDER BY timestamp DESC");
        $logs = $result->fetch_all(MYSQLI_ASSOC);
        echo json_encode($logs);
        break;

    case "DELETE":
        $id = $_GET['id'];
        $conn->query("DELETE FROM logs WHERE id = $id");
        echo json_encode(["message" => "Registro deletado com sucesso"]);
        break;

    default:
        http_response_code(405);
        echo json_encode(["error" => "Método não suportado"]);
}
?>
