var express = require('express');
var router = express.Router();
var mongoose = require('mongoose');
var classification = require('../models/classification');
var product = require('../models/product.js');


mongoose.connect('mongodb://127.0.0.1:27017/DONGMU',{useMongoClient: true});
mongoose.connection.on("connected",function(){
  console.log("mongoose connect sucess!!!");
})
mongoose.connection.on("error",function(){
  console.log("mongoose connect fail!!!");
})
mongoose.connection.on("disconnected",function(){
  console.log("mongoose connect disconnected!!!");
})
//取得所有的分类
router.get("/",function(req,res,next){
  classification.find({},function(err,doc){
    if(err){
      res.json({
        status:'0',
        msg:err.message
      });
    }else{
      res.json({
        status:'1',
        msg:'get all classification suecess!',
        result:{
          count:doc.length,
          allClass:doc
        }
      })
    }
  })
})
//插入某个二级分类
router.post("/insertSecond",function(req,res,next){
  let father = req.body.father || '',
      name = req.body.name || '';
    console.log("插入某个二级分类")
    let  sencondClass={
      "label":name
    }
    classification.update({_id:father},
                          {$push:{children:sencondClass}},
                        function(err,doc){
                          if(err){
                            res.json({
                              status:"1",
                              message:err.message
                            });
                          }else{
                            res.json({
                              status:"0",
                              msg:"",
                              result:"sucess"
                            })
                          }
                        })
})
//插入某个一级分类
router.post("/insertFirst",function(req,res,next){
  let father = req.body.father || '',
      name = req.body.name || '';
    if(father=='' && name){
      console.log("插入某个一级分类")
      let classificationOne=
        {
          "key":2,
          "label":name,
          "children":[]
        };
      classification.create(classificationOne,function(err3,classification){
          if(err3){
            res.json({
              status:"1",
              message:err3.message
            });
          }else{
            res.json({
              status:"0",
              msg:"",
              result:"sucess"
            })
          }
      })
    }else{
      console.log("params err!");
    }
}),
//编辑某个分类
router.post("/edit",function(req,res,next){
  var editId = req.body.id, //正在被编辑的分类的id，可能父或子
      name   =req.body.label,//正在被编辑的分类的名字
      // index   =req.body.index,
      father=req.body.father; //父分类的ID或为undefined
  var query,
      updateContaint,
      requirement,
      operation,
      index;
  //设置修改条件
  var set = new Promise((resolve,reject)=>{
      if(father!=undefined){
        //修改二级分类
        console.log("修改二级分类");
         query = { _id: father,"children._id":editId};
         updateContaint={$set:{"children.$.label":name}};
         resolve();
       }else{
        //修改一级分类
        console.log("修改一级分类");
         query = { _id: editId };
         updateContaint={label:name};
         resolve();
       }
    })
  //修改class表中的相应分类
  function updateClass(){
    return new Promise((resolve,reject)=>{
        classification.updateOne(query,updateContaint,function(err,raw){
          if(err){
            res.json({
              status:"1",
              message:err.message
            });
          }else {
            if(raw.nModified !=0 ){
              resolve();
            }else{
              res.json({
                status:"1",
                message:"err.message"
              });
            }
          }
          console.log('claa表', raw);
        })
    })
  }
  set.then(updateClass)
     .then(()=>{
       res.json({
         status:"0",
         msg:name,
         result:"edit secess"
       })
     })
     .catch(()=>{
       res.json({
         status:"1",
         message:err.message
       });
     })
}),
//删除某个分类
router.post("/delete",function(req,res,next){
  let editId = req.body.id,
      fatherId = req.body.fatherId;

  let query = { _id: editId };
  console.log(fatherId);
//删除某个二级分类
if(fatherId && editId){
  console.log("删除某个二级分类fatherId:"+fatherId);
  classification.update({_id:fatherId},{
    $pull:{
      'children':{"_id":editId}
    }
  },function(err,doc){
    if(err){
      res.json({
        status:"1",
        message:err.message
      });
    }else{
      res.json({
        status:"0",
        msg:"",
        result:"delete secess"
      })
    }
  })
}
if(fatherId == ''|| fatherId==undefined){
  //删除一级分类和其自分类
  console.log("删除一级分类和其子分类")
  classification.findByIdAndRemove(query,function(err,raw){
    if(err){
      res.json({
        status:"1",
        message:err.message
      });
    }else{
      if(raw==null){
        res.json({
          status:"1",
          result:"没找到该条document"
        })
      }else{
        res.json({
          status:"0",
          result:"delete sucess"
        })
      }

    }
    console.log('The raw response from Mongo was ', raw);
  })
}
}),

module.exports = router;
