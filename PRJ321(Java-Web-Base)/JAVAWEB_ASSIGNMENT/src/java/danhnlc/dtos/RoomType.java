package danhnlc.dtos;

import java.io.Serializable;

public class RoomType implements Serializable {

    private String typeID;
    private String typeName;
    private String description;

    public RoomType() {
    }

    public RoomType(String typeID, String typeName, String description) {
        this.typeID = typeID;
        this.typeName = typeName;
        this.description = description;
    }

    public String getTypeID() {
        return typeID;
    }

    public void setTypeID(String typeID) {
        this.typeID = typeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
}
