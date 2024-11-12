// app/javascript/channels/consumer.js

import { createConsumer } from "@rails/actioncable";

export default createConsumer("ws://localhost:4000/cable");
