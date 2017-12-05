package shortUrlPortlet.portlet;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;

import shortUrlPortlet.constants.ShortUrlPortletKeys;

@Component(
	    immediate = true,
	    property = {
	       "javax.portlet.name=" + ShortUrlPortletKeys.ShortUrl,
	       "mvc.command.name=/shorturl/view"
	    },
	    service = MVCRenderCommand.class
	)
public class ShortUrlMVCRenderCommand implements MVCRenderCommand {

	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {

		System.out.println("executing ShortUrlMVCRendererCommand's render method "+renderRequest.getParameter("word2"));

		return "/view.jsp";
		//return "/sample_mvc_render_command.jsp";
	}

}