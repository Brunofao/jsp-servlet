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
public class Historial {
    //
    private String id;
    private Veterinario veterinario;
    private Mascota mascota;
    private String diagnostic;
    private String treatment;
    private Double price;
    //

    public Historial() {
    }

    public Historial(String id, Veterinario veterinario, Mascota mascota, String diagnostic, String treatment, Double price) {
        this.id = id;
        this.veterinario = veterinario;
        this.mascota = mascota;
        this.diagnostic = diagnostic;
        this.treatment = treatment;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public Veterinario getVeterinario() {
        return veterinario;
    }

    public Mascota getMascota() {
        return mascota;
    }

    public String getDiagnostic() {
        return diagnostic;
    }

    public String getTreatment() {
        return treatment;
    }

    public Double getPrice() {
        return price;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setVeterinario(Veterinario veterinario) {
        this.veterinario = veterinario;
    }

    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }

    public void setDiagnostic(String diagnostic) {
        this.diagnostic = diagnostic;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Historial{" + "id=" + id + ", veterinario=" + veterinario + ", mascota=" + mascota + ", diagnostic=" + diagnostic + ", treatment=" + treatment + ", price=" + price + '}';
    }
}
