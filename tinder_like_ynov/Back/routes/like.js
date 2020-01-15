var express = require('express');
var router = express.Router();
var fs = require('fs');

router.post('/', function(req, res, next) {
    var user = req.body.user;
    var isLiked = req.body.isLiked;
    var target = req.body.target;
    var stringToSave = user + ' ' + (isLiked ? 'like'  : 'dislikes ') + target;

    var stream = fs.createWriteStream("database.txt", {flags:'a'});
    stream.write( stringToSave + '\n');
    res.end();
});

module.exports = router;
 