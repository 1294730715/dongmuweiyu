<template>
  <div class="">
    <div class="personal-info">
      <h2> {{customer.name}} </h2><span>{{customer.address}} &nbsp &nbsp</span><span>{{customer.phone}}</span>
    </div>
    <Verify-general v-if="tableData.length !=0" @generalAomunt="getGeneralAomunt"  v-bind:table-data="tableData"  v-bind:visibility="true"></Verify-general>
    <div class="style"></div>
    <Verify-door v-if="tableData3.length !=0" @doorAomunt="getDoorAmount"  v-bind:table-data3="tableData3" v-bind:visibility="true"></Verify-door>
    <div class="">
      合计:{{this.allAmount}}
    </div>
   <el-form>
   <el-form-item>
     <el-button type="primary" @click="onSubmit">立即创建</el-button>
     <el-button>取消</el-button>
   </el-form-item>
 </el-form>
 <el-dialog title="创建订单" :visible.sync="createOrder">
   <el-form :model="orderStatus">
     <el-form-item label="定金（元）">
       <el-input v-model="orderStatus.status" auto-complete="off"></el-input>
     </el-form-item>
   </el-form>
   <div slot="footer" class="dialog-footer">
     <el-button @click="addCartVisible = false">取 消</el-button>
     <el-button type="primary" @click="handleCart">确 定</el-button>
   </div>
 </el-dialog>
  </div>
</template>
<style media="screen">
  .style{
    height: 30px;
  }
  .personal-info{
    text-align: center;
    margin-bottom: 50px;
  }
</style>
<script>
import VerifyDoor from './VerifyDoor.vue'
import VerifyGeneral from './VerifyGeneral.vue'

  export default {
    components:{
      VerifyDoor,
      VerifyGeneral
    },
    data() {
      return {
        customer:{
          name:'',
          address:'',
          phone:''
        },
        tableData3: [],
        tableData: [],//普通货物
        allAmount:0,
        generalAll:0,
        doorAll:0,
        orderStatus:{
          status:''
        },
        createOrder:false
      }
    },
    mounted:function(){
      this.getDoorGoodscart();
      this.queryCart();
      this.getThisCustomer();
    },
    methods: {
      getThisCustomer(){
        this.$http({
          url:"/customer/oneCustomer"
        }).then(res=>{
          this.customer=res.data.result.cus;
        },error=>{
          this.$notify.error({
            title: '错误',
            message: '获取订单列表失败'
          });
        })
      },
      getGeneralAomunt(generalAmount){
        this.allAmount-=this.generalAll;
        this.allAmount+=generalAmount
        this.generalAll=generalAmount;
        console.log("generalAmount"+generalAmount);
      },
      getDoorAmount(doorAmount){
        this.allAmount-=this.doorAll;
        this.allAmount+=doorAmount;
        this.doorAll=doorAmount;
        console.log("doorAmount"+doorAmount);
      },
      onSubmit(){
        this.createOrder=true;
        this.orderStatus.status = this.allAmount
      },
      queryCart(){
        this.$http({
          url:'/customer/cart',
        }).then(res=>{
          var data = res.data.result.products;
          var cart = res.data.result.cartList;
          var result=[];
          for(var m =0;m<data.length;m++){
            for(var n =0;n<cart.length;n++){
              if(data[m].id == cart[n]._id){
                result[m] = {};
                result[m].id=data[m]._id;
                result[m].proId=data[m].id;
                result[m].price=data[m].salePrice;
                result[m].num=data[m].saleNumber;
                // result[m].unit=data[m].unit;
                result[m].name=cart[n].name;
                result[m].spec=cart[n].spec;
                result[m].code=cart[n].code;
              }
            }
          }
          this.tableData=result
        },error=>{
          console.log("查询不到数据");
        })
      },
      getDoorGoodscart(){
        this.$http({
          method:"get",
          url:"/customer/DoorGoodscart"
        }).then(res=>{
          this.tableData3=res.data.result.DoorGoods
        },error=>{
          this.$notify.error({
            title: '错误',
            message: '货物定门单失败，请联系管理员'
          });
        })
      },
      handleCart(){
        this.createOrder=false
        this.$http({
          method:"post",
          url:"/customer/createOrder",
          data:{
            paied:this.orderStatus.status,
            allAmount:this.allAmount
          }
        }).then(res=>{
          this.tableData=[];
          this.tableData3=[];
          this.$notify({
             title: '成功',
             message: '创建订单成功',
             type: 'success'
           });
        },error=>{
          this.$notify.error({
            title: '错误',
            message: '加入购物车失败'
          });
        })
      }
    }
  }
</script>
