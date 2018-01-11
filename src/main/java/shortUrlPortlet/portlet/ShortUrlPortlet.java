package shortUrlPortlet.portlet;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import shortUrlPortlet.constants.ShortUrlPortletKeys;

/**
 * @author carlos
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=false",
		"javax.portlet.display-name=shortUrlPortlet Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + ShortUrlPortletKeys.ShortUrl,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class ShortUrlPortlet extends MVCPortlet {
	

	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException, IOException {
		System.out.println("executing portlet's render method "+renderRequest.getParameter("word2"));
		super.render(renderRequest, renderResponse);

	}
	@Override
	public void doView(
			RenderRequest renderRequest, RenderResponse renderResponse)
		throws IOException, PortletException {
		System.out.println("executing doView in our ShortUrlPortlet");
		super.doView(renderRequest, renderResponse);
	}
	
	public void myAction(ActionRequest request, ActionResponse response)
	        throws PortalException, SystemException {

			System.out.println("action being executed ");
			System.out.println("param1="+request.getParameter("param1"));

	        response.setRenderParameter("mvcPath", "/view.jsp");

	}
	

}

