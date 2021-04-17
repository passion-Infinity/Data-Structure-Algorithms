package danhnlc.dto;

import java.sql.Timestamp;

public class DiscountDTO {
    
    private String Id;
    private String name;
    private Timestamp startDay, endDay;
    private String value;
    private boolean status;

    public DiscountDTO() {
    }

    public DiscountDTO(String Id, String name, Timestamp startDay, Timestamp endDay, String value, boolean status) {
        this.Id = Id;
        this.name = name;
        this.startDay = startDay;
        this.endDay = endDay;
        this.value = value;
        this.status = status;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getStartDay() {
        return startDay;
    }

    public void setStartDay(Timestamp startDay) {
        this.startDay = startDay;
    }

    public Timestamp getEndDay() {
        return endDay;
    }

    public void setEndDay(Timestamp endDay) {
        this.endDay = endDay;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
