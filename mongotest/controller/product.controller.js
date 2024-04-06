
const product = require('../models/prodeuct.model');

async function productGetHandler(req,res){
    console.log('product get handler method run');
    try {
        const products = await product.find(); 
        res.status(200).json(products);
    } catch (err) {
        console.error(err);
        res.status(500).send({ message: 'Error fetching products' });
    }
 
}



async function productPostHandler(req,res){
    const body = req.body;
    console.log(body);
   if(body.name && body.price === null || ''){
        res.status(400).send({
            msg : "json data can't be null or empty"
        });
    }
    await product.create({
        name : body.name,
        price: body.price
    });
    res.status(200).send({
        msg: 'successfully saved data',
        data:{
            name : body.name,
            product: body.price
        }
    });  

}



async function productPatchHandler(req,res){
    const body = req.body;
    const id = body.id;
    const replacedurl = await product.findById(id);
    const updateStatus = await product.findByIdAndUpdate(id,{name: body.name,price: body.price});
     

    if(!updateStatus){
      return  res.status(300).send({
            status : " sorry no id found"
        });
    }
    
  return  res.status(200).send({
        status: "successfully updated",
        data: replacedurl
    });
}



async function productDeleteHandler(req,res){
    
    const body = req.body;
    const id = body.id;
    const deletedData = await product.findById(id);
    const result = await product.findByIdAndDelete(id);
   
    if(!result){
      return  res.status(302).send({
            msg : 'unable to find the id'
        });
    }

  return  res.status(200).send({
        msg: 'deleted successfully',
        data: deletedData
    });
}



module.exports = {
    productGetHandler,
    productPostHandler,
    productPatchHandler,
    productDeleteHandler
}   