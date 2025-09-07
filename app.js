const express = require('express');
const app = express()

msg = "Hello world! this is nodejs in a docker container.. succesfully"

app.get('/', (req, res) => res.send(msg));

app.listen(3000, () => {
    console.log("app running on port 3000...");
})