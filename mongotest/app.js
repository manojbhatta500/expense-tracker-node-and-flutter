const express = require('express');
const mongoose = require('mongoose');
const productRoute = require('./routes/product.route');

const app = express();


mongoose.connect('mongodb://127.0.0.1:27017/mongotest').then(()=>{
    console.log('mongodb connected .......');
});



app.use(express.json());



app.use('/product',productRoute);


app.use((req,res,next)=>{

    res.status(404).send({
        error : 'api not found'
    });
    
});



const port = 3000

app.listen(port,()=>{
    console.log('server has started'); 
});