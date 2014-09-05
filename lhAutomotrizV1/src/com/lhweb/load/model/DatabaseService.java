package com.lhweb.load.model;



public class DatabaseService {

	/* service provider*/
	private static final Database db =  new Database("127.0.0.1",27017,"LHA");

    
    
    public static Database getService(Database DBconnection){
		
    	
		try {
			db.connect();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
		DBconnection = db;
		return DBconnection;
		
    }
    
    public static void releaseService(Database DBconnection){
    	
    	/* db variable and DBconnections input  are both the same object you can use both db.close() or DBconeccion.close()*/
    	//db.close(); 
    	/*TODO verify above assertion , please base on 
    	     i.e http://stackoverflow.com/questions/3963983/how-and-where-to-use-static-modifier-in-java
    	*/
    	
    	DBconnection.close();
    }
	
    
    
}
