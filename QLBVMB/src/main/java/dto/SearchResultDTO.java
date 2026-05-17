package dto;

public class SearchResultDTO {
    private String type;
    private String id;
    private String title;
    private String subTitle;

    public SearchResultDTO() {
    }

    public SearchResultDTO(String type, String id, String title, String subTitle) {
        this.type = type;
        this.id = id;
        this.title = title;
        this.subTitle = subTitle;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }
}
