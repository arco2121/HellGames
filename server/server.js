const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const ejs = require('ejs');
const app = express();

const port = process.env.PORT || 3000;
const link =  "127.1.0.0"; //Given Domain
const getURL = (uri = "",secure = false) => {
    if(link == "127.1.0.0" || link == "localhost")
        secure = false;
    return "http" + secure?"s":"" + "://" + ip + ":" + port + "/" + uri
}
const corsOptions = {
  origin: "*",
  methods: ['GET', 'POST'],
  allowedHeaders: ['Content-Type'],
};
const db = mysql.createConnection({
    database : "hell_games_databank",
    host : link,
    user : "root",
    password : "",
});
db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database!');
});

app.set('view engine', 'ejs');
app.use(express.static("./public"));
app.use(cors(corsOptions));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const doQuery = (query) => {
    return new Promise((resolve, reject) => {
        db.query(query, (err, results) => {
            if (err) return reject(err);
            resolve(results);
        });
    });
};

app.get(["/","/index.html","index","home"], async (req, res) => {
    try 
    {
        const game = await doQuery("SELECT * FROM games ORDER BY RAND() LIMIT 1;");
        const gamesTop = await doQuery("SELECT * FROM games ORDER BY rating DESC LIMIT 3;");
        res.render("index", { game: game[0], gamesTop });
    } catch (err) {
        console.error(err);
        res.status(500).render("error");
    }
})

app.get(["/search/:something", "/s/:something"], async (req, res) => {
    try 
    {
        const search = req.params.something;
        let query = "SELECT * FROM games";
        if (search) {
            query += ` WHERE name LIKE ?`;
        }
        const games = await doQuery(search ? [query, [`%${search}%`]] : query);
        res.render("result", { games, search });
    } catch (err) {
        console.error(err);
        res.status(500).render("error");
    }
});

app.get(["game/:id","/g/:id"], async (req, res) => {
    try
    {
        const id = req.params.id;
        const query = "SELECT * FROM games WHERE id = " + id;
        const reso = await doQuery(query);
        res.render("game", {game : reso});

    }
    catch
    {
        res.render("game", {id : req.params.id});        
    }
})

app.use((req, res, next) => {
    res.status(404).render('error')
});

app.listen(port,()=>{
    console.log(`Server is running on port ${port} and link ${getURL()}`);
})