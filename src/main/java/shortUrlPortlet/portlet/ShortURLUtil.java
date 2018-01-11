package shortUrlPortlet.portlet;

public class ShortURLUtil {

	public static String removeParameterFromURL(String url,String param){
		param+="=";
		int start = url.indexOf(param);
    	int end = url.indexOf("&", start+param.length());
    	end = (end == -1 ? url.length() : end); 
		return (url.substring(0, start)+url.substring(end, url.length())).replaceAll("\\?&","?").replaceAll("&$","").replaceAll("&&*","&").replaceAll("\\?$","");

	}

	public static String getParameterFromURL(String url,String param){
		param+="=";
		int start = url.indexOf(param)+param.length();
    	int end = url.indexOf("&", start);
    	end = (end == -1 ? url.length() : end); 
		return url.substring(start, end);
	}

}
