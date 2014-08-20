package com.lhweb.load.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


/**
 * Created by s47id on 5/3/14.
 */
public class Sales {

    private Date eventDate;
    private String who;
    private Cart cart;
    private Double total;


    public Sales(){
        this.eventDate = new Date();
        this.who = "";
        this.cart = new Cart();
        this.total = 0.0;
    }


    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }



    public String getWho() {
        return who;
    }

    public void setWho(String who) {
        this.who = who;
    }


    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }


    public void addItem(String barCode){
        /**
         * Add item one by one
         */
        cart.addItem(barCode);


    }

    public void addItems(String barCode,int quantity){
        /**
         * Add several items of the same barCode
         */

        // add condition to check available

        for (int i = 0; i < quantity ; i++){
            cart.addItem(barCode);
        }



    }


    public void removeItem(){

        //Remove is not used in  persistence layer.
    }


    public int completeSale(){


        /*decrease existence   -----*/
    	int response = -1;
    	try{
    		String barCode;
            int howMany, existence;
            Double balance = 0.0;
            Double unitSalePrice = 0.0;

            SparePart sparePart = new SparePart();
            List<HashMap<String,Object>> items = new ArrayList<HashMap<String, Object>>();

            items = this.getCart().getItems();
            /*we require a new instance , in order to call existenceSparePart method in a cleaned instance */
            SparePart aux = new SparePart();
            
            // setting new existence for every spare parts.
            for(int i = 0 ; i < items.size() ; i++){

                barCode =  items.get(i).get("barCode").toString();      
                howMany =  Integer.parseInt(items.get(i).get("howMany").toString());
                unitSalePrice = Double.parseDouble(items.get(i).get("unitSalePrice").toString());
            	sparePart.loadSparePart(barCode);
                existence = sparePart.getExistence();
                balance =  sparePart.getBalance();

                
                if( existence > 0 ){
                	//System.out.println("entro al if: "+existence);

                    sparePart.setExistence(existence-howMany);
                    sparePart.setBalance(balance - howMany*unitSalePrice);
                    sparePart.storeSparePart();
                    
                    // update balance

                    /* save record ---*/
                    //System.out.println("Sales - Venta.");
                    //inserting Object to db
                    HashMap<String,Object> salesObject =  new HashMap<String, Object>();
                    salesObject.put("eventDate",this.getEventDate());
                    salesObject.put("who",this.getWho());
                    salesObject.put("cart",this.getCart().getItems());
                    salesObject.put("total",this.getTotal());

                    //System.out.println("cart" + this.getCart().getItems());
                    //System.out.println("sales Object : " + salesObject);


                    Stock stock = new Stock();
                    stock.connect();

                    stock.storeJSONObject(salesObject,"sales");

                    stock.close();
                    response = 0;
                }else{
                	System.out.println("Response por que no existe: "+existence);
                	response = -1;
                }
                

            }
    	}catch(Exception e){
    		e.printStackTrace();
    		response = -1;
    	}
        
return response;
    }


    public List<HashMap<String,Object>> getSalesRecords(){

        List<HashMap<String,Object>> records =  new ArrayList<HashMap<String, Object>>();



        return records;

    }





}

