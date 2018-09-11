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
package Models;

/**
 *
 * @author John Wick Recargado
 */
public class RoomSPA {
    //
    private String id;
    private Mascota mascota;
    private Estilista estilista;
    //

    public RoomSPA() {
    }

    public RoomSPA(String id, Mascota mascota, Estilista estilista) {
        this.id = id;
        this.mascota = mascota;
        this.estilista = estilista;
    }

    public String getId() {
        return id;
    }

    public Mascota getMascota() {
        return mascota;
    }

    public Estilista getEstilista() {
        return estilista;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }

    public void setEstilista(Estilista estilista) {
        this.estilista = estilista;
    }

    @Override
    public String toString() {
        return "RoomSPA{" + "id=" + id + ", mascota=" + mascota + ", estilista=" + estilista + '}';
    }
}
