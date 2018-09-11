/*
 * The MIT License
 *
 * Copyright 2018 John Wick Recargado.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package DAO;

import Models.Conexion;
import Models.RoomSPA;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author John Wick Recargado
 */
public class SpaDAO {
    //
    Conexion con;
    ObjectContainer db = null;
    //
    
    public SpaDAO() {
        con = new Conexion();
    }
    
    public void add(RoomSPA s) {
        db = con.open();
        db.store(s);
        con.close(db);
    }
    
    public List<RoomSPA> read() {
        db = con.open();
        List<RoomSPA> s = new ArrayList<>();
        ObjectSet listS = db.queryByExample(RoomSPA.class);
        listS.forEach((listS0) -> {
            s.add((RoomSPA)listS0);
        });
        con.close(db);
        return s;
    }
    
    public RoomSPA findARoomSPA(RoomSPA s) {        
        db = con.open();
        ObjectSet result = db.queryByExample(s);
        RoomSPA roomspa = (RoomSPA) result.next();
        con.close(db);
        return roomspa;
    }
    
    public RoomSPA findARoomSPAByID(String id) {
        db = con.open();
        Query query = db.query();
        query.constrain(RoomSPA.class);
        query.descend(id);
        ObjectSet result = query.execute();
        RoomSPA roomspa = (RoomSPA) result.next();
        con.close(db);
        return roomspa;
    }
    
    public void clearDatabase() {
        db = con.open();
        ObjectSet result = db.queryByExample(RoomSPA.class);
        while(result.hasNext()) {
            db.delete(result.next());
        }
        con.close(db);
    }
}
