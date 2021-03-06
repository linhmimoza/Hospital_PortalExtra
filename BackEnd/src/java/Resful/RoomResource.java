/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resful;

import Models.Room;
import dao.RoomDAO;
import java.sql.SQLException;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Admin
 */
@Path("generic")
public class RoomResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of RoomResource
     */
    public RoomResource() {
    }

  
@Path("/getListRoom")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Room> getListRoom() throws SQLException, ClassNotFoundException {
     RoomDAO dao = new RoomDAO();
            List<Room> listRooms = dao.getRooms();
          
            return listRooms;
    }
     @Path("/getRoomById/{roomId}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Room getUserById(@PathParam("roomId") int roomId) throws SQLException, ClassNotFoundException {
    RoomDAO dao = new RoomDAO();                    
          Room room = dao.getRoomById(roomId);
            return room;
    }
    
   @POST
   @Path("/updateRoom")
   @Produces()
   public String updateRoom(Room room){
     RoomDAO dao=new RoomDAO();   
     return dao.updateRoom(room);
   }
   
   @POST
   @Path("/createRoom")
   @Produces()
   public String createRoom(Room room){
     RoomDAO dao=new RoomDAO();   
     return dao.createRoom(room);
   }
}
