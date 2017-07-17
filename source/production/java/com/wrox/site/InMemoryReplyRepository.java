package com.wrox.site;

import com.wrox.site.entity.Reply;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

@Repository
public class InMemoryReplyRepository implements ReplyRepository
{
	private static final Logger log = LogManager.getLogger();
	
    private final Map<Long, Reply> database = new Hashtable<>();
    private volatile long replyIdSequence = 1L;

    @Override
    public List<Reply> getForDiscussion(long id)
    {
    	log.info("Replying for message"+id);
        ArrayList<Reply> list = new ArrayList<>(this.database.values());
        list.removeIf(r -> r.getDiscussionId() != id);
        return list;
    }

    @Override
    public synchronized void add(Reply reply)
    {
    	log.info("Adding for reply for message"+reply.getDiscussionId());
        reply.setId(this.getNextReplyId());
        this.database.put(reply.getId(), reply);
    }

    @Override
    public synchronized void update(Reply reply)
    {
    	log.info("Updating for reply "+reply.getId());
        this.database.put(reply.getId(), reply);
    }

    @Override
    public synchronized void deleteForDiscussion(long id)
    {
    	log.info("Deleting for all replies for discussion reply ");
    	
        this.database.entrySet()
                .removeIf(e -> e.getValue().getDiscussionId() == id);
    }

    private synchronized long getNextReplyId()
    {
        return this.replyIdSequence++;
    }
}
