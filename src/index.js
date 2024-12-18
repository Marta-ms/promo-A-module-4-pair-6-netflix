const express = require('express');
const cors = require('cors');
const mysql = require("mysql2/promise");

// create and config server
const server = express();
server.use(cors());
server.use(express.json());


//conectar a la bbdd


async function getDBConnection() {
  const connection = await mysql.createConnection({
      // configuración
      host: "localhost",
      user: "root",
      password: "12345",
      database: "netflix",
      port: 3306
  })
  connection.connect();
  return connection;
}

// init express aplication
const serverPort = 4001;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

const fakeMovies = [
  {
    id: 1,
    title: "Wonder Woman",
    genre: "Action",
    image:
      "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/12/gal-gadot-como-wonder-woman-universo-extendido-dc-2895594.jpg?tf=3840x",
    category: "Superhero",
    year: 2017,
    director: "Patty Jenkins",
  },
  {
    id: 2,
    title: "Inception",
    genre: "Science Fiction",
    image:
      "https://m.media-amazon.com/images/S/pv-target-images/e826ebbcc692b4d19059d24125cf23699067ab621c979612fd0ca11ab42a65cb._SX1080_FMjpg_.jpg",
    category: "Thriller",
    year: 2010,
    director: "Christopher Nolan",
  },
];

server.get("/movies", async (req, res) => {
  console.log(req.params.movieId);
  const connection = await getDBConnection();
  const query = "SELECT * FROM movies";
  const [result] = await connection.query(query);
  console.log(result);

  connection.end();

  if (result.length === 0) {
    res.status(404).json({
        success: "error",
        message: "No se encontraron estudiantes"
    })
} else {
    res.status(200).json({
        success: true,
        message: fakeMovies
    });
}
});

//Insertar nuevo usuario para registro en la db
const query = "INSERT INTO users (user, hashed_password, email) VALUE (?, ?, ?)";
const [result] = await connection.query(query, [
  user, passwordHashed, email
])
console.log(result);


//EndPoint para autenticación
server.post("/sign-up", async (req, res) =>{
  const { user, password, email } = req.body;
  const connection = await getDBConnection();
  console.log(user,password, email);

  //verificar que el mail existe en nuestra base de datos
  const emailQuery = "SELECT * FROM users WHERE email = ?";
  const [resultUser] = await connection.query(emailQuery, [email]);
  res.json({
  });

})

