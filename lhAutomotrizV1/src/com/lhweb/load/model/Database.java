package com.lhweb.load.model;


import com.mongodb.MongoClient;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;

import java.net.UnknownHostException;
import java.util.*;


public class Database {
 
   
    private String hostname;
    private int port;
    private String dbName;
    private DB db = null;
    private MongoClient mongoClient = null;


    public Database(){
    }


    public Database(String hostname, int port,String dbName){
    	//TODO set user & password for secure reasons
    	this.hostname=hostname;
    	this.port=port;
    	this.dbName=dbName;
    }


    public void connect() throws Exception {
   
    	 mongoClient = new MongoClient(hostname,port);
		 db = mongoClient.getDB(dbName);
		 
		 /* useful for multiple host in HA Architecture*/
		 //MongoClient mongoClient = new MongoClient(new MongoClientURI("mongodb://localhost:27017"));
    }
    

    public void close(){
        mongoClient.close();
    }

    
    
    
    public  void getService(){
    	
		/** If you want to use another database services in the runtime you must create another getService2,3,4.. methods*/
    	
    	 try {
			mongoClient = new MongoClient("127.0.0.1",27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 db = mongoClient.getDB("LHA");
    	 //db = mongoClient.getDB("LHA_TestDB");
		 
    }
    
  
    

    public void createPerson(){
    	
    	/* You can see the similarities between the Document that’s stored in MongoDB, and your domain object.
    	 * In your code, that person would probably be a Person class, with simple primitive fields, an array field,
    	 * and an Address field. */
		List<Integer> books = Arrays.asList(27464, 747854);
		DBObject person = new BasicDBObject("name", "Jo Bloggs")		                            
		                            .append("address", new BasicDBObject("street", "123 Fake St")
		                                                         .append("city", "Faketon")
		                                                         .append("state", "MA")
		                                                         .append("zip", 12345))
		                            .append("books", books);
		DBCollection collection = db.getCollection("people");
		collection.insert(person);
    }

    
    public void insert(String collectionName, DBObject newDocument){
    	DBCollection collection = db.getCollection(collectionName);
    	collection.insert(newDocument);
    	
    }
    
    public void insert(String collectionName, List<DBObject> newDocuments){
    	DBCollection collection = db.getCollection(collectionName);
    	collection.insert(newDocuments);
    	
    }
    

    
    /* former method */
    public void insertDocumentS(String collectionName,HashMap<String,Object> newDoc){
        DBCollection collection = db.getCollection(collectionName);


        BasicDBObject newDocument = new BasicDBObject("employeeID",newDoc.get("employeeID")).
                append("fullName", newDoc.get("fullName")).
                append("lanID", newDoc.get("lanID"));


        //newDocument = new BasicDBObject(newDoc);
        collection.insert(newDocument);
       


    }

    /* former method */
    public void insertDocument(String collectionName,List<String> keys,HashMap<String,Object> newDoc){
        DBCollection collection = db.getCollection(collectionName);

        BasicDBObject newDocument = new BasicDBObject();

        for(int i  = 0 ; i < keys.size() ; i++){
            newDocument.append(keys.get(i),newDoc.get(keys.get(i)));
        }

        System.out.println(newDocument);
        collection.insert(newDocument);


    }

    /* In MongoDB we query by example(it is a document DB), 
     * building up a document that looks like the document we’re looking for.*/
    
    //public  List<Map<String,Object>>runQuery(Map<String,Object> query,String collectionName){
    public  List<DBObject>runQuery(DBObject query,DBObject fields,String collectionName){
    	
    	List<DBObject> resultSet =  new ArrayList<DBObject>();
    	
    	DBCollection collection = db.getCollection(collectionName);
    	DBCursor cursor = collection.find(query,fields);
    	//DBObject q =  new BasicDBObject("name","Audi");
    	//DBCursor cursor = collection.find(q);
    	
    	//List obj = collection.find( query ).skip( 1000 ).limit( 100 ).toArray();
    	 
    	while( cursor.hasNext() ){
    		 resultSet.add(cursor.next());
    	}
    	    
    	 
    	
    	
    	return resultSet;
    }
    

    
    public HashMap<String,Object>  getAll(String collectionName){
    	
    	HashMap<String,Object> resultSet = new HashMap<String, Object>();
    	DBCollection collection = db.getCollection(collectionName);
    	DBCursor cursor = collection.find();
    	DBObject doc;
    	
    	try {
            while(cursor.hasNext()) {

                //System.out.println(cursor.next());

                doc = cursor.next();
                for( String key : doc.keySet()){
                    //System.out.println(key);
                    //System.out.println(doc.get(key));
                    resultSet.put(key,doc.get(key));
                    
                }


            }
        } finally {
            cursor.close();
        }

    	
    	
    	return resultSet;
        
    }
    
    
    
    
    
    public HashMap<String,Object> select(HashMap<String,Object> query,String collectionName){
        HashMap<String,Object> resultSet = new HashMap<String, Object>();

        DBCollection collection = db.getCollection(collectionName);
        BasicDBObject findQuery = new BasicDBObject();

        for ( String key : query.keySet() ) {
            findQuery.append(key,query.get(key));
        }


        //System.out.println("Query =>" + findQuery );
        
        DBCursor cursor = collection.find(findQuery);
        DBObject doc;


        try {
            while(cursor.hasNext()) {

                //System.out.println(cursor.next());

                doc = cursor.next();
                for( String key : doc.keySet()){
                    //System.out.println(key);
                    //System.out.println(doc.get(key));
                    resultSet.put(key,doc.get(key));
                }


            }
        } finally {
            cursor.close();
        }



        return resultSet;
    }



    
    /* former method */
    
    public List<HashMap<Object,Object>> getAllDocuments(String collectionName) {
        List<HashMap<Object,Object>> resultSet = new ArrayList<HashMap<Object,Object>>();
        DBCollection collection = db.getCollection(collectionName);


        DBCursor cursor = collection.find();

        int count = 0;

        try {
            while(cursor.hasNext()) {
            	//if(cursor.next() instanceof HashMap) {}
                resultSet.add((HashMap<Object,Object>) cursor.next());
                count+=1;

            }



        } finally {
            cursor.close();
        }



        return resultSet;
    }

    
    public static List<String> stringFormattedToStringList(String s) {
        //public static List<String> stringFormattedToStringList(String s) {

            List<String> result = new ArrayList<String>();
            List<String> aux;
            aux =  Arrays.asList(s.substring(1,s.length()-1).replaceAll("\"", "").split(","));
            // .substring  removes the first an last characters from the string ('[' & ']')
            // .replaceAll removes all quotation marks from the string (replaces with empty string)
            // .split brakes the string into a string array on commas (omitting the commas)
            // Arrays.asList converts the array to a List
            /**
             * Example of string that handle
             * [ "auto 1", "auto 2", "auto 3"]
             *
             */

            for(int i=0;i<aux.size() ; i++) {
                result.add(aux.get(i).trim()); //.trim() - clean extra white spaces
            }

            return result;
        }

	
        
	
	
}
