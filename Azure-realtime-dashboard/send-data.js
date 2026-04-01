require("dotenv").config();
const { EventHubProducerClient } = require("@azure/event-hubs");

const connectionString = process.env.EVENT_HUB_CONNECTION_STRING;
const eventHubName = process.env.EVENT_HUB_NAME;

const producer = new EventHubProducerClient(connectionString, eventHubName);

async function sendData() {
    try {
        const batch = await producer.createBatch();

        const data = {
            deviceId: "sensor-01",
            temperature: Number((20 + Math.random() * 10).toFixed(2)),
            humidity: Number((50 + Math.random() * 20).toFixed(2)),
            timestamp: new Date().toISOString()
        };

        batch.tryAdd({ body: data });

        await producer.sendBatch(batch);
        console.log("Sent:", data);
    } catch (err) {
        console.error("Error sending data:", err);
    }
}

setInterval(sendData, 3000);