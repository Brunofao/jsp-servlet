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
import Models.Persona;
import Models.Veterinario;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Predicate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author John Wick Recargado
 */
public class VeterinarioDAO {
    //
    Conexion con;
    ObjectContainer db = null;
    //
    
    public VeterinarioDAO() {
        con = new Conexion();
    }
    
    public void add(Veterinario v) {
        db = con.open();
        db.store(v);
        con.close(db);
    }
    
    public List<Veterinario> read() {
        db = con.open();
        List<Veterinario> v = new ArrayList<>();
        ObjectSet listV = db.queryByExample(Veterinario.class);
        listV.forEach((listV0) -> {
            v.add((Veterinario)listV0);
        });
        con.close(db);
        return v;
    }
    
    public Persona findAVeterinario(Veterinario v) {        
        db = con.open();
        ObjectSet result = db.queryByExample(v);
        Veterinario veterinario = (Veterinario) result.next();
        con.close(db);
        return veterinario;
    }
    
    public Veterinario findAVeterinarioByDNI(ObjectContainer db, String reference) {
        Veterinario toUpdate = db.query(new Predicate<Veterinario>() {
            @Override
            public boolean match(Veterinario veterinario) {
                return veterinario.getReference().equals(reference);
            }
        }).get(0);
        return toUpdate;
    }
    
    public Veterinario findAVeterinarioByDNI2(ObjectContainer db, String dni) {
        Veterinario toUpdate = db.query(new Predicate<Veterinario>() {
            @Override
            public boolean match(Veterinario veterinario) {
                return veterinario.getDni().equals(dni);
            }
        }).get(0);
        return toUpdate;
    }
    
    public void clearDatabase() {
        db = con.open();
        ObjectSet result = db.queryByExample(Veterinario.class);
        while(result.hasNext()) {
            db.delete(result.next());
        }
        con.close(db);
    }
}
