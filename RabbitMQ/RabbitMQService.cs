//using RabbitMQ.Client;
//using System.Text;

//namespace RabbitMQ;
//public class RabbitMQService
//{
//    private readonly IConnection _connection;
//    private readonly IModel _channel;

//    public RabbitMQService()
//    {
//        var factory = new ConnectionFactory() { HostName = "http://localhost:15672" };
//        _connection = factory.CreateConnection();
//        _channel = _connection.CreateModel();

//        _channel.ExchangeDeclare(exchange: "messages_exchange", type: "direct");
//        _channel.QueueDeclare(queue: "sponsor_queue", durable: false, exclusive: false, autoDelete: false, arguments: null);
//        _channel.QueueDeclare(queue: "takmicar_queue", durable: false, exclusive: false, autoDelete: false, arguments: null);
//        _channel.QueueBind(queue: "sponsor_queue", exchange: "messages_exchange", routingKey: "sponsor");
//        _channel.QueueBind(queue: "takmicar_queue", exchange: "messages_exchange", routingKey: "takmicar");
//    }

//    public void SendMessage(string message, string routingKey)
//    {
//        var body = Encoding.UTF8.GetBytes(message);
//        _channel.BasicPublish(exchange: "messages_exchange", routingKey: routingKey, basicProperties: null, body: body);
//    }
//}


