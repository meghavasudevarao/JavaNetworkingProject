package com.wrox.site;

import com.wrox.site.entity.Discussion;
import com.wrox.site.form.DiscussionForm;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import javax.inject.Inject;

import java.util.Map;

@Controller
@RequestMapping("discussion")
public class BoardController
{
	private static final Logger log = LogManager.getLogger();
    
    @Inject DiscussionService discussionService;

    @RequestMapping(value = {"", "list"}, method = RequestMethod.GET)
    public String listDiscussions(Map<String, Object> model)
    {
    	log.info("GET :discussion/list");
        model.put("discussions", this.discussionService.getAllDiscussions());
        return "discussion/list";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createDiscussion(Map<String, Object> model)
    {
    	log.info("GET :discussion/create");
        model.put("discussionForm", new DiscussionForm());
        return "discussion/create";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public View createDiscussion(DiscussionForm form)
    {
    	log.info("POST :discussion/discussion.getId()");
        Discussion discussion = new Discussion();
        discussion.setUser(form.getUser());
        discussion.setSubject(form.getSubject());
        discussion.setMessage(form.getMessage());
        this.discussionService.saveDiscussion(discussion);

        return new RedirectView("/discussion/" + discussion.getId() + "/" +
                discussion.getUriSafeSubject(), true, false);
    }
    
    @RequestMapping(value = "delete" , method = RequestMethod.GET)
    public void deleteDiscussion(@RequestParam("id")long id)
    {
    	log.info("GET :discussion/delete");
    	this.discussionService.deleteDiscussion(id);
    }
}
