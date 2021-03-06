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
public class Mascota {
    //
    private Persona persona;
    private String id;
    private String name;
    private String species;
    private Float weight;
    private String sex;
    private String age;
    private String race;
    private Historial history;
    private Boolean status;
    //

    public Mascota() {
    }
    
    public Mascota(Persona persona, String name, String species, Float weight, String sex, String age, String race, Historial history) {
        this.persona = persona;
        this.name = name;
        this.species = species;
        this.weight = weight;
        this.sex = sex;
        this.age = age;
        this.race = race;
        this.history = history;
        this.id = this.generateID();
        this.status = Boolean.TRUE;
    }

    public Persona getPersona() {
        return persona;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSpecies() {
        return species;
    }

    public Float getWeight() {
        return weight;
    }

    public String getSex() {
        return sex;
    }

    public String getAge() {
        return age;
    }

    public String getRace() {
        return race;
    }

    public Historial getHistory() {
        return history;
    }
    
    public Boolean getStatus() {
        return status;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public void setId() {
        this.id = this.generateID();
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public void setHistory(Historial history) {
        this.history = history;
    }
    
    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Mascota{" + "persona=" + persona + ", id=" + id + ", name=" + name + ", species=" + species + ", weight=" + weight + ", sex=" + sex + ", age=" + age + ", race=" + race + ", status=" + status + '}';
    }

    /*
    @Override
    public String toString() {
        return "Mascota{" + "persona=" + persona + ", id=" + id + ", name=" + name + ", species=" + species + ", weight=" + weight + ", sex=" + sex + ", age=" + age + ", race=" + race + '}';
    }
    */
    
    public final String generateID () {
        return this.persona.getDni() + "-" + (this.persona.hashCode()/2); // this.persona.getLastname().toLowerCase() + (this.persona.getDni() + this.name + this.species).toLowerCase();
    }
}
