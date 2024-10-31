package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.model.SocialMedia;
import vn.edu.hcmuaf.fit.service.impl.AddressService;
import vn.edu.hcmuaf.fit.service.impl.SocialMediaService;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/loadAddress", loadOnStartup = 1)
public class LoadAddress extends HttpServlet {

    @Override
    public void init() throws ServletException {
        Address addresses = AddressService.getInstance().loadAddress();
        getServletContext().setAttribute("address", addresses);

        SocialMedia socialMedia = SocialMediaService.getInstance().load();
        getServletContext().setAttribute("social_media", socialMedia);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}