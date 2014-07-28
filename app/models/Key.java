package models;

import play.data.validation.Constraints;
import play.db.ebean.Model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class Key extends Model {
  /* ----- Fields ----- */
  @Id
  private Long primaryKey;

  @Constraints.Required
  private Long deviceId;

  @Constraints.Required
  private String key;

  /* ----- Relationships ----- */
  @ManyToMany(cascade = CascadeType.ALL)
  private Set<Person> persons = new HashSet<>();

  @OneToOne
  private OpqDevice opqDevice;

  @OneToMany(mappedBy = "key", cascade = CascadeType.ALL)
  private List<Event> events = new ArrayList<>();

  public Long getPrimaryKey() {
    return primaryKey;
  }

  public void setPrimaryKey(Long primaryKey) {
    this.primaryKey = primaryKey;
  }

  public String getKey() {
    return key;
  }

  public void setKey(String key) {
    this.key = key;
  }

  public Set<Person> getPersons() {
    return persons;
  }

  public void setPersons(Set<Person> persons) {
    this.persons = persons;
  }

  public OpqDevice getOpqDevice() {
    return opqDevice;
  }

  public void setOpqDevice(OpqDevice opqDevice) {
    this.opqDevice = opqDevice;
  }

  public List<Event> getEvents() {
    return events;
  }

  public void setEvents(List<Event> events) {
    this.events = events;
  }

  public static Finder<Long, Key> find() {
    return new Finder<>(Long.class, Key.class);
  }

  public Long getDeviceId() {
    return deviceId;
  }

  public void setDeviceId(Long deviceId) {
    this.deviceId = deviceId;
  }
}
