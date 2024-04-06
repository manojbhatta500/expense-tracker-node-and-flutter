const mongoose = require('mongoose');
const { Schema } = mongoose;




const productSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    price: {
        type : Number,
        required: true
    }
});


const product = mongoose.model('product',productSchema);



module.exports = product