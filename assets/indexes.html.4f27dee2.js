import{_ as l,r as o,o as p,c as r,a,b as s,d as e,e as t}from"./app.f0c7c707.js";const c={},i=t(`<h1 id="indexes" tabindex="-1"><a class="header-anchor" href="#indexes" aria-hidden="true">#</a> Indexes</h1><p>Indexes are Isar&#39;s most powerful feature. Many embedded databases offer &quot;normal&quot; indexes (if at all), but Isar also has composite and multi-entry indexes. Understanding how indexes work is essential to optimize query performance. Isar lets you choose which index you want to use and how you want to use it. We&#39;ll start with a quick introduction to what indexes are.</p><h2 id="what-are-indexes" tabindex="-1"><a class="header-anchor" href="#what-are-indexes" aria-hidden="true">#</a> What are indexes?</h2><p>When a collection is unindexed, the order of the rows will likely not be discernible by the query as optimized in any way, and your query will therefore have to search through the objects linearly. In other words, the query will have to search through every object to find the ones matching the conditions. As you can imagine, that can take some time. Looking through every single object is not very efficient.</p><p>For example, this <code>Product</code> collection is entirely unordered.</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Product</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> name;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">int</span><span style="color:#ABB2BF;"> price;</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><h4 id="data" tabindex="-1"><a class="header-anchor" href="#data" aria-hidden="true">#</a> Data:</h4><table><thead><tr><th>id</th><th>name</th><th>price</th></tr></thead><tbody><tr><td>1</td><td>Book</td><td>15</td></tr><tr><td>2</td><td>Table</td><td>55</td></tr><tr><td>3</td><td>Chair</td><td>25</td></tr><tr><td>4</td><td>Pencil</td><td>3</td></tr><tr><td>5</td><td>Lightbulb</td><td>12</td></tr><tr><td>6</td><td>Carpet</td><td>60</td></tr><tr><td>7</td><td>Pillow</td><td>30</td></tr><tr><td>8</td><td>Computer</td><td>650</td></tr><tr><td>9</td><td>Soap</td><td>2</td></tr></tbody></table><p>A query that tries to find all products that cost more than €30 has to search through all nine rows. That&#39;s not an issue for nine rows, but it might become a problem for 100k rows.</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> expensiveProducts </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.products.</span><span style="color:#61AFEF;">filter</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">priceGreaterThan</span><span style="color:#ABB2BF;">(</span><span style="color:#D19A66;">30</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">();</span></span>
<span class="line"></span></code></pre></div><p>To improve the performance of this query, we index the <code>price</code> property. An index is like a sorted lookup table:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Product</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> name;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">int</span><span style="color:#ABB2BF;"> price;</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><h4 id="generated-index" tabindex="-1"><a class="header-anchor" href="#generated-index" aria-hidden="true">#</a> Generated index:</h4><table><thead><tr><th>price</th><th>id</th></tr></thead><tbody><tr><td>2</td><td>9</td></tr><tr><td>3</td><td>4</td></tr><tr><td>12</td><td>5</td></tr><tr><td>15</td><td>1</td></tr><tr><td>25</td><td>3</td></tr><tr><td>30</td><td>7</td></tr><tr><td><mark><strong>55</strong></mark></td><td><mark><strong>2</strong></mark></td></tr><tr><td><mark><strong>60</strong></mark></td><td><mark><strong>6</strong></mark></td></tr><tr><td><mark><strong>650</strong></mark></td><td><mark><strong>8</strong></mark></td></tr></tbody></table><p>Now, the query can be executed a lot faster. The executor can directly jump to the last three index rows and find the corresponding objects by their id.</p><h3 id="sorting" tabindex="-1"><a class="header-anchor" href="#sorting" aria-hidden="true">#</a> Sorting</h3><p>Another cool thing: indexes can do super fast sorting. Sorted queries are costly because the database has to load all results in memory before sorting them. Even if you specify an offset or limit, they are applied after sorting.</p><p>Let&#39;s imagine we want to find the four cheapest products. We could use the following query:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> cheapest </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.products.</span><span style="color:#61AFEF;">filter</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">sortByPrice</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">limit</span><span style="color:#ABB2BF;">(</span><span style="color:#D19A66;">4</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">();</span></span>
<span class="line"></span></code></pre></div><p>In this example, the database would have to load all (!) objects, sort them by price, and return the four products with the lowest price.</p><p>As you can probably imagine, this can be done much more efficiently with the previous index. The database takes the first four rows of the index and returns the corresponding objects since they are already in the correct order.</p><p>To use the index for sorting, we would write the query like this:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> cheapestFast </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.products.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">anyPrice</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">limit</span><span style="color:#ABB2BF;">(</span><span style="color:#D19A66;">4</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">();</span></span>
<span class="line"></span></code></pre></div><p>The <code>.anyX()</code> where clause tells Isar to use an index just for sorting. You can also use a where clause like <code>.priceGreaterThan()</code> and get sorted results.</p><h2 id="unique-indexes" tabindex="-1"><a class="header-anchor" href="#unique-indexes" aria-hidden="true">#</a> Unique indexes</h2><p>A unique index ensures the index does not contain any duplicate values. It may consist of one or multiple properties. If a unique index has one property, the values in this property will be unique. If the unique index has more than one property, the combination of values in these properties is unique.</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(unique</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">true</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> username;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">int</span><span style="color:#ABB2BF;"> age;</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><p>Any attempt to insert or update data into the unique index that causes a duplicate will result in an error:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> user1 </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..id </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">1</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..username </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#98C379;">&#39;user1&#39;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..age </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">25</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.users.</span><span style="color:#61AFEF;">put</span><span style="color:#ABB2BF;">(user1); </span><span style="color:#7F848E;">// -&gt; ok</span></span>
<span class="line"></span>
<span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> user2 </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..id </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">2</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..username </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#98C379;">&#39;user1&#39;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..age </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">30</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#7F848E;">// try to insert user with same username</span></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.users.</span><span style="color:#61AFEF;">put</span><span style="color:#ABB2BF;">(user2); </span><span style="color:#7F848E;">// -&gt; error: unique constraint violated</span></span>
<span class="line"><span style="color:#61AFEF;">print</span><span style="color:#ABB2BF;">(</span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.user.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">().</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">());</span></span>
<span class="line"><span style="color:#7F848E;">// &gt; [{id: 1, username: &#39;user1&#39;, age: 25}]</span></span>
<span class="line"></span></code></pre></div><h2 id="replace-indexes" tabindex="-1"><a class="header-anchor" href="#replace-indexes" aria-hidden="true">#</a> Replace indexes</h2><p>It is sometimes not preferable to throw an error if a unique constraint is violated. Instead, you may want to replace the existing object with the new one. This can be achieved by setting the <code>replace</code> property of the index to <code>true</code>.</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(unique</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">true</span><span style="color:#ABB2BF;">, replace</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">true</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> username;</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><p>Now when we try to insert a user with an existing username, Isar will replace the existing user with the new one.</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> user1 </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..id </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">1</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..username </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#98C379;">&#39;user1&#39;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..age </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">25</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.users.</span><span style="color:#61AFEF;">put</span><span style="color:#ABB2BF;">(user1);</span></span>
<span class="line"><span style="color:#61AFEF;">print</span><span style="color:#ABB2BF;">(</span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.user.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">().</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">());</span></span>
<span class="line"><span style="color:#7F848E;">// &gt; [{id: 1, username: &#39;user1&#39;, age: 25}]</span></span>
<span class="line"></span>
<span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> user2 </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..id </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">2</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..username </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#98C379;">&#39;user1&#39;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..age </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">30</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.users.</span><span style="color:#61AFEF;">put</span><span style="color:#ABB2BF;">(user2);</span></span>
<span class="line"><span style="color:#61AFEF;">print</span><span style="color:#ABB2BF;">(</span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.user.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">().</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">());</span></span>
<span class="line"><span style="color:#7F848E;">// &gt; [{id: 2, username: &#39;user1&#39; age: 30}]</span></span>
<span class="line"></span></code></pre></div><p>Replace indexes also generate <code>putBy()</code> methods that allow you to update objects instead of replacing them. The existing id is reused, and links are still populated.</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> user1 </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..id </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">1</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..username </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#98C379;">&#39;user1&#39;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..age </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">25</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#7F848E;">// user does not exist so this is the same as put()</span></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.users.</span><span style="color:#61AFEF;">putByUsername</span><span style="color:#ABB2BF;">(user1);</span></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.user.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">().</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">(); </span><span style="color:#7F848E;">// -&gt; [{id: 1, username: &#39;user1&#39;, age: 25}]</span></span>
<span class="line"></span>
<span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> user2 </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">User</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..id </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">2</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..username </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#98C379;">&#39;user1&#39;</span></span>
<span class="line"><span style="color:#ABB2BF;">  ..age </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">30</span><span style="color:#ABB2BF;">;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.users.</span><span style="color:#61AFEF;">put</span><span style="color:#ABB2BF;">(user2);</span></span>
<span class="line"><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.user.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">().</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">(); </span><span style="color:#7F848E;">// -&gt; [{id: 1, username: &#39;user1&#39; age: 30}]</span></span>
<span class="line"></span></code></pre></div><p>As you can see, the id of the first inserted user is reused.</p><h2 id="case-insensitive-indexes" tabindex="-1"><a class="header-anchor" href="#case-insensitive-indexes" aria-hidden="true">#</a> Case-insensitive indexes</h2><p>All indexes on <code>String</code> and <code>List&lt;String&gt;</code> properties are case-sensitive by default. If you want to create a case-insensitive index, you can use the <code>caseSensitive</code> option:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Person</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(caseSensitive</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">false</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> name;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(caseSensitive</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">false</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">List</span><span style="color:#ABB2BF;">&lt;</span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;">&gt; tags;</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><h2 id="index-type" tabindex="-1"><a class="header-anchor" href="#index-type" aria-hidden="true">#</a> Index type</h2><p>There are different types of indexes. Most of the time, you&#39;ll want to use an <code>IndexType.value</code> index, but hash indexes are more efficient.</p><h3 id="value-index" tabindex="-1"><a class="header-anchor" href="#value-index" aria-hidden="true">#</a> Value index</h3><p>Value indexes are the default type and the only one allowed for all properties that don&#39;t hold Strings or Lists. Property values are used to build the index. In the case of lists, the elements of the list are used. It is the most flexible but also space-consuming of the three index types.</p><div class="custom-container tip"><p class="custom-container-title">Tip</p><p>Use <code>IndexType.value</code> for primitives, Strings where you need <code>startsWith()</code> where clauses, and Lists if you want to search for individual elements.</p></div><h3 id="hash-index" tabindex="-1"><a class="header-anchor" href="#hash-index" aria-hidden="true">#</a> Hash index</h3><p>Strings and Lists can be hashed to reduce the storage required by the index significantly. The disadvantage of hash indexes is that they can&#39;t be used for prefix scans (<code>startsWith</code> where clauses).</p><div class="custom-container tip"><p class="custom-container-title">Tip</p><p>Use <code>IndexType.hash</code> for Strings and Lists if you don&#39;t need <code>startsWith</code>, and <code>elementEqualTo</code> where clauses.</p></div><h3 id="hashelements-index" tabindex="-1"><a class="header-anchor" href="#hashelements-index" aria-hidden="true">#</a> HashElements index</h3><p>String lists can be hashed as a whole (using <code>IndexType.hash</code>), or the elements of the list can be hashed separately (using <code>IndexType.hashElements</code>), effectively creating a multi-entry index with hashed elements.</p><div class="custom-container tip"><p class="custom-container-title">Tip</p><p>Use <code>IndexType.hashElements</code> for <code>List&lt;String&gt;</code> where you need <code>elementEqualTo</code> where clauses.</p></div><h2 id="composite-indexes" tabindex="-1"><a class="header-anchor" href="#composite-indexes" aria-hidden="true">#</a> Composite indexes</h2><p>A composite index is an index on multiple properties. Isar allows you to create composite indexes of up to three properties.</p><p>Composite indexes are also known as multiple-column indexes.</p><p>It&#39;s probably best to start with an example. We create a person collection and define a composite index on the age and name properties:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Person</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> name;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(composite</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> [</span><span style="color:#E5C07B;">CompositeIndex</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;name&#39;</span><span style="color:#ABB2BF;">)])</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">int</span><span style="color:#ABB2BF;"> age;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> hometown;</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><h4 id="data-1" tabindex="-1"><a class="header-anchor" href="#data-1" aria-hidden="true">#</a> Data:</h4><table><thead><tr><th>id</th><th>name</th><th>age</th><th>hometown</th></tr></thead><tbody><tr><td>1</td><td>Daniel</td><td>20</td><td>Berlin</td></tr><tr><td>2</td><td>Anne</td><td>20</td><td>Paris</td></tr><tr><td>3</td><td>Carl</td><td>24</td><td>San Diego</td></tr><tr><td>4</td><td>Simon</td><td>24</td><td>Munich</td></tr><tr><td>5</td><td>David</td><td>20</td><td>New York</td></tr><tr><td>6</td><td>Carl</td><td>24</td><td>London</td></tr><tr><td>7</td><td>Audrey</td><td>30</td><td>Prague</td></tr><tr><td>8</td><td>Anne</td><td>24</td><td>Paris</td></tr></tbody></table><h4 id="generated-index-1" tabindex="-1"><a class="header-anchor" href="#generated-index-1" aria-hidden="true">#</a> Generated index</h4><table><thead><tr><th>age</th><th>name</th><th>id</th></tr></thead><tbody><tr><td>20</td><td>Anne</td><td>2</td></tr><tr><td>20</td><td>Daniel</td><td>1</td></tr><tr><td>20</td><td>David</td><td>5</td></tr><tr><td>24</td><td>Anne</td><td>8</td></tr><tr><td>24</td><td>Carl</td><td>3</td></tr><tr><td>24</td><td>Carl</td><td>6</td></tr><tr><td>24</td><td>Simon</td><td>4</td></tr><tr><td>30</td><td>Audrey</td><td>7</td></tr></tbody></table><p>The generated composite index contains all persons sorted by their age their name.</p><p>Composite indexes are great if you want to create efficient queries sorted by multiple properties. They also enable advanced where clauses with multiple properties:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> result </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">ageNameEqualTo</span><span style="color:#ABB2BF;">(</span><span style="color:#D19A66;">24</span><span style="color:#ABB2BF;">, </span><span style="color:#98C379;">&#39;Carl&#39;</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">hometownProperty</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">() </span><span style="color:#7F848E;">// -&gt; [&#39;San Diego&#39;, &#39;London&#39;]</span></span>
<span class="line"></span></code></pre></div><p>The last property of a composite index also supports conditions like <code>startsWith()</code> or <code>lessThan()</code>:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> result </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">ageEqualToNameStartsWith</span><span style="color:#ABB2BF;">(</span><span style="color:#D19A66;">20</span><span style="color:#ABB2BF;">, </span><span style="color:#98C379;">&#39;Da&#39;</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">() </span><span style="color:#7F848E;">// -&gt; [Daniel, David]</span></span>
<span class="line"></span></code></pre></div><h2 id="multi-entry-indexes" tabindex="-1"><a class="header-anchor" href="#multi-entry-indexes" aria-hidden="true">#</a> Multi-entry indexes</h2><p>If you index a list using <code>IndexType.value</code>, Isar will automatically create a multi-entry index, and each item in the list is indexed toward the object. It works for all types of lists.</p><p>Practical applications for multi-entry indexes include indexing a list of tags or creating a full-text index.</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">@collection</span></span>
<span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Product</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> description;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(type</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">IndexType</span><span style="color:#ABB2BF;">.value, caseSensitive</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">false</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">List</span><span style="color:#ABB2BF;">&lt;</span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;">&gt; </span><span style="color:#C678DD;">get</span><span style="color:#ABB2BF;"> </span><span style="color:#61AFEF;">descriptionWords</span><span style="color:#ABB2BF;"> =&gt; </span><span style="color:#E5C07B;">Isar</span><span style="color:#ABB2BF;">.</span><span style="color:#61AFEF;">splitWords</span><span style="color:#ABB2BF;">(description);</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div>`,69),d=a("code",null,"Isar.splitWords()",-1),B={href:"https://unicode.org/reports/tr29/",target:"_blank",rel:"noopener noreferrer"},y=t('<h4 id="data-2" tabindex="-1"><a class="header-anchor" href="#data-2" aria-hidden="true">#</a> Data:</h4><table><thead><tr><th>id</th><th>description</th><th>descriptionWords</th></tr></thead><tbody><tr><td>1</td><td>comfortable blue t-shirt</td><td>[comfortable, blue, t-shirt]</td></tr><tr><td>2</td><td>comfortable, red pullover!!!</td><td>[comfortable, red, pullover]</td></tr><tr><td>3</td><td>plain red t-shirt</td><td>[plain, red, t-shirt]</td></tr><tr><td>4</td><td>red necktie (super red)</td><td>[red, necktie, super, red]</td></tr></tbody></table><p>Entries with duplicate words only appear once in the index.</p><h4 id="generated-index-2" tabindex="-1"><a class="header-anchor" href="#generated-index-2" aria-hidden="true">#</a> Generated index</h4><table><thead><tr><th>descriptionWords</th><th>id</th></tr></thead><tbody><tr><td>comfortable</td><td>[1, 2]</td></tr><tr><td>blue</td><td>1</td></tr><tr><td>necktie</td><td>4</td></tr><tr><td>plain</td><td>3</td></tr><tr><td>pullover</td><td>2</td></tr><tr><td>red</td><td>[2, 3, 4]</td></tr><tr><td>super</td><td>4</td></tr><tr><td>t-shirt</td><td>[1, 3]</td></tr></tbody></table><p>This index can now be used for prefix (or equality) where clauses of the individual words of the description.</p>',6),h={class:"custom-container tip"},F=a("p",{class:"custom-container-title"},"Tip",-1),A={href:"https://en.wikipedia.org/wiki/Phonetic_algorithm",target:"_blank",rel:"noopener noreferrer"},u={href:"https://en.wikipedia.org/wiki/Soundex",target:"_blank",rel:"noopener noreferrer"};function D(g,C){const n=o("ExternalLinkIcon");return p(),r("div",null,[i,a("p",null,[d,s(" splits a string into words according to the "),a("a",B,[s("Unicode Annex #29"),e(n)]),s(" specification, so it works for almost all languages correctly.")]),y,a("div",h,[F,a("p",null,[s("Instead of storing the words directly, also consider using the result of a "),a("a",A,[s("phonetic algorithm"),e(n)]),s(" like "),a("a",u,[s("Soundex"),e(n)]),s(".")])])])}const f=l(c,[["render",D],["__file","indexes.html.vue"]]);export{f as default};
