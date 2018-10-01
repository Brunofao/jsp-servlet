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
public class RoomSurgery {
    //
    private String id;
    private Mascota mascota;
    private Veterinario veterinario;
    private Boolean status;
    //

    public RoomSurgery() {
    }

    public RoomSurgery(Mascota mascota, Veterinario veterinario) {
        this.mascota = mascota;
        this.veterinario = veterinario;
        this.status = Boolean.TRUE;
        this.id = this.generateID();
    }

    public String getId() {
        return id;
    }

    public Mascota getMascota() {
        return mascota;
    }

    public Veterinario getVeterinario() {
        return veterinario;
    }
    
    public Boolean getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public void setId() {
        this.id = this.generateID();
    }
    
    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }

    public void setVeterinario(Veterinario veterinario) {
        this.veterinario = veterinario;
    }
    
    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    private String generateID() {
        return (this.veterinario.getReference() + "-surgery-" + this.mascota.getId() + this.mascota.hashCode());
    }

    @Override
    public String toString() {
        return "RoomSurgery{" + "id=" + id + ", mascota=" + mascota + ", veterinario=" + veterinario + ", status=" + status + '}';
    }
}
