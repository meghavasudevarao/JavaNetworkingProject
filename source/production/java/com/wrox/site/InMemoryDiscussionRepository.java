package com.wrox.site;

import com.wrox.site.entity.Discussion;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

@Repository
public class InMemoryDiscussionRepository implements DiscussionRepository
{
	private static final Logger log = LogManager.getLogger();
	
    private final Map<Long, Discussion> database = new Hashtable<>();
    private volatile long discussionIdSequence = 1L;
    @Inject ReplyRepository replyRepository;

    @Override
    public List<Discussion> getAll()
    {
    	log.info("In get all function");
        return new ArrayList<>(this.database.values());
    }

    @Override
    public Discussion get(long id)
    {
    	log.info("In get discussion"+id);
        return this.database.get(id);
    }

    @Override
    public void add(Discussion discussion)
    {
    	log.info("In Add  Discussion"+discussion.getMessage());
        discussion.setId(this.getNextDiscussionId());
        this.database.put(discussion.getId(), discussion);
    }

    @Override
    public void update(Discussion discussion)
    {
    	log.info("In update  Discussion"+discussion.getMessage());
        this.database.put(discussion.getId(), discussion);
    }

    @Override
    public void delete(long id)
    {
    	log.info("In delete  Discussion"+id);
        this.database.remove(id);
        this.replyRepository.deleteForDiscussion(id);
    }

    private synchronized long getNextDiscussionId()
    {
        return this.discussionIdSequence++;
    }
}
