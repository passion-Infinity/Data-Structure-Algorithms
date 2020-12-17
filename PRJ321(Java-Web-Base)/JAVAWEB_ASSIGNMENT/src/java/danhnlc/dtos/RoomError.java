package danhnlc.dtos;

import java.io.Serializable;

public class RoomError implements Serializable {

    private String roomIDError;
    private String typeIDError;
    private String roomNameError;
    private String roomFloorError;
    private String priceError;
    private String numberOfPersonsError;
    private String statusError;

    public RoomError() {
    }

    public RoomError(String roomIDError, String typeIDError, String roomNameError, String roomFloorError, String priceError, String numberOfPersonsError, String statusError) {
        this.roomIDError = roomIDError;
        this.typeIDError = typeIDError;
        this.roomNameError = roomNameError;
        this.roomFloorError = roomFloorError;
        this.priceError = priceError;
        this.numberOfPersonsError = numberOfPersonsError;
        this.statusError = statusError;
    }
    

    public String getRoomIDError() {
        return roomIDError;
    }

    public void setRoomIDError(String roomIDError) {
        this.roomIDError = roomIDError;
    }

    public String getTypeIDError() {
        return typeIDError;
    }

    public void setTypeIDError(String typeIDError) {
        this.typeIDError = typeIDError;
    }

    public String getRoomNameError() {
        return roomNameError;
    }

    public void setRoomNameError(String roomNameError) {
        this.roomNameError = roomNameError;
    }

    public String getRoomFloorError() {
        return roomFloorError;
    }

    public void setRoomFloorError(String roomFloorError) {
        this.roomFloorError = roomFloorError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getNumberOfPersonsError() {
        return numberOfPersonsError;
    }

    public void setNumberOfPersonsError(String numberOfPersonsError) {
        this.numberOfPersonsError = numberOfPersonsError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

}
