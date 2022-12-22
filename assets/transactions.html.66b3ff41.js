import{_ as t,r as o,o as e,c as r,a as s,b as a,d as l,e as c}from"./app.f0c7c707.js";const p={},i=s("h1",{id:"transactions",tabindex:"-1"},[s("a",{class:"header-anchor",href:"#transactions","aria-hidden":"true"},"#"),a(" Transactions")],-1),d={href:"http://en.wikipedia.org/wiki/ACID",target:"_blank",rel:"noopener noreferrer"},B=c(`<h2 id="explicit-transactions" tabindex="-1"><a class="header-anchor" href="#explicit-transactions" aria-hidden="true">#</a> Explicit transactions</h2><p>In an explicit transaction, you get a consistent snapshot of the database. Try to minimize the duration of transactions. It is forbidden to do network calls or other long-running operations in a transaction.</p><p>Transactions (especially write transactions) do have a cost, and you should always try to group successive operations into a single transaction.</p><p>Transactions can either be synchronous or asynchronous. In synchronous transactions, you may only use synchronous operations. In asynchronous transactions, only async operations.</p><table><thead><tr><th></th><th>Read</th><th>Read &amp; Write</th></tr></thead><tbody><tr><td>Synchronous</td><td><code>.txnSync()</code></td><td><code>.writeTxnSync()</code></td></tr><tr><td>Asynchronous</td><td><code>.txn()</code></td><td><code>.writeTxn()</code></td></tr></tbody></table><h3 id="read-transactions" tabindex="-1"><a class="header-anchor" href="#read-transactions" aria-hidden="true">#</a> Read transactions</h3><p>Explicit read transactions are optional, but they allow you to do atomic reads and rely on a consistent state of the database inside the transaction. Internally Isar always uses implicit read transactions for all read operations.</p><div class="custom-container tip"><p class="custom-container-title">Tip</p><p>Async read transactions run in parallel to other read and write transactions. Pretty cool, right?</p></div><h3 id="write-transactions" tabindex="-1"><a class="header-anchor" href="#write-transactions" aria-hidden="true">#</a> Write transactions</h3><p>Unlike read operations, write operations in Isar must be wrapped in an explicit transaction.</p><p>When a write transaction finishes successfully, it is automatically committed, and all changes are written to disk. If an error occurs, the transaction is aborted, and all the changes are rolled back. Transactions are “all or nothing”: either all the writes within a transaction succeed, or none of them take effect to guarantee data consistency.</p><div class="custom-container warning"><p class="custom-container-title">Warning</p><p>When a database operation fails, the transaction is aborted and must no longer be used. Even if you catch the error in Dart.</p></div><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Contact</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">String</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> name;</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span>
<span class="line"><span style="color:#7F848E;">// GOOD</span></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.</span><span style="color:#61AFEF;">writeTxn</span><span style="color:#ABB2BF;">(() </span><span style="color:#C678DD;">async</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">for</span><span style="color:#ABB2BF;"> (</span><span style="color:#C678DD;">var</span><span style="color:#ABB2BF;"> contact </span><span style="color:#C678DD;">in</span><span style="color:#ABB2BF;"> </span><span style="color:#61AFEF;">getContacts</span><span style="color:#ABB2BF;">()) {</span></span>
<span class="line"><span style="color:#ABB2BF;">    </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.contacts.</span><span style="color:#61AFEF;">put</span><span style="color:#ABB2BF;">(contact);</span></span>
<span class="line"><span style="color:#ABB2BF;">  }</span></span>
<span class="line"><span style="color:#ABB2BF;">});</span></span>
<span class="line"></span>
<span class="line"><span style="color:#7F848E;">// BAD: move loop inside transaction</span></span>
<span class="line"><span style="color:#C678DD;">for</span><span style="color:#ABB2BF;"> (</span><span style="color:#C678DD;">var</span><span style="color:#ABB2BF;"> contact </span><span style="color:#C678DD;">in</span><span style="color:#ABB2BF;"> </span><span style="color:#61AFEF;">getContacts</span><span style="color:#ABB2BF;">()) {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.</span><span style="color:#61AFEF;">writeTxn</span><span style="color:#ABB2BF;">(() </span><span style="color:#C678DD;">async</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">    </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.contacts.</span><span style="color:#61AFEF;">put</span><span style="color:#ABB2BF;">(contact);</span></span>
<span class="line"><span style="color:#ABB2BF;">  });</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div>`,13);function y(h,u){const n=o("ExternalLinkIcon");return e(),r("div",null,[i,s("p",null,[a("In Isar, transactions combine multiple database operations in a single unit of work. Most interactions with Isar implicitly use transactions. Read & write access in Isar is "),s("a",d,[a("ACID"),l(n)]),a(" compliant. Transactions are automatically rolled back if an error occurs.")]),B])}const A=t(p,[["render",y],["__file","transactions.html.vue"]]);export{A as default};
