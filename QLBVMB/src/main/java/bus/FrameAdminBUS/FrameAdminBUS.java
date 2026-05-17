package bus.FrameAdminBUS;

import dao.FrameAdminDAO.FrameAdminDAO;
import dto.NotificationDTO;
import dto.SearchResultDTO;

import java.util.List;

public class FrameAdminBUS {

    private final FrameAdminDAO dao = new FrameAdminDAO();

    public List<SearchResultDTO> globalSearch(String keyword) {
        return dao.globalSearch(keyword);
    }

    public List<NotificationDTO> getUrgentNotifications() {
        return dao.getUrgentNotifications();
    }
}
