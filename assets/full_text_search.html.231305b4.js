import{_ as l,r as t,o as p,c as r,a,b as s,d as e,e as o}from"./app.f0c7c707.js";const c={},i=o(`<h1 id="full-text-search" tabindex="-1"><a class="header-anchor" href="#full-text-search" aria-hidden="true">#</a> Full-text search</h1><p>Full-text search is a powerful way to search text in the database. You should already be familiar with how <a href="/indexes">indexes</a> work, but let&#39;s go over the basics.</p><p>An index works like a lookup table, allowing the query engine to find records with a given value quickly. For example, if you have a <code>title</code> field in your object, you can create an index on that field to make it faster to find objects with a given title.</p><h2 id="why-is-full-text-search-useful" tabindex="-1"><a class="header-anchor" href="#why-is-full-text-search-useful" aria-hidden="true">#</a> Why is full-text search useful?</h2><p>You can easily search text using filters. There are various string operations for example <code>.startsWith()</code>, <code>.contains()</code> and <code>.matches()</code>. The problem with filters is that their runtime is <code>O(n)</code> where <code>n</code> is the number of records in the collection. String operations like <code>.matches()</code> are especially expensive.</p><div class="custom-container tip"><p class="custom-container-title">Tip</p><p>Full-text search is much faster than filters, but indexes have some limitations. In this recipe, we will explore how to work around these limitations.</p></div><h2 id="basic-example" tabindex="-1"><a class="header-anchor" href="#basic-example" aria-hidden="true">#</a> Basic example</h2><p>The idea is always the same: Instead of indexing the whole text, we index the words in the text so we can search for them individually.</p><p>Let&#39;s create the most basic full-text index:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Message</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> content;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">List</span><span style="color:#ABB2BF;">&lt;</span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;">&gt; </span><span style="color:#C678DD;">get</span><span style="color:#ABB2BF;"> </span><span style="color:#61AFEF;">contentWords</span><span style="color:#ABB2BF;"> =&gt; content.</span><span style="color:#61AFEF;">split</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39; &#39;</span><span style="color:#ABB2BF;">);</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><p>We can now search for messages with specific words in the content:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> posts </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.messages</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">contentWordsAnyEqualTo</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;hello&#39;</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">();</span></span>
<span class="line"></span></code></pre></div><p>This query is super fast, but there are some problems:</p><ol><li>We can only search for entire words</li><li>We do not consider punctuation</li><li>We do not support other whitespace characters</li></ol><h2 id="splitting-text-the-right-way" tabindex="-1"><a class="header-anchor" href="#splitting-text-the-right-way" aria-hidden="true">#</a> Splitting text the right way</h2><p>Let&#39;s try to improve the previous example. We could try to develop a complicated regex to fix word splitting, but it will likely be slow and wrong for edge cases.</p>`,16),B={href:"https://unicode.org/reports/tr29/",target:"_blank",rel:"noopener noreferrer"},d=o(`<div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#E5C07B;">Isar</span><span style="color:#ABB2BF;">.</span><span style="color:#61AFEF;">splitWords</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;hello world&#39;</span><span style="color:#ABB2BF;">); </span><span style="color:#7F848E;">// -&gt; [&#39;hello&#39;, &#39;world&#39;]</span></span>
<span class="line"></span>
<span class="line"><span style="color:#E5C07B;">Isar</span><span style="color:#ABB2BF;">.</span><span style="color:#61AFEF;">splitWords</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;The quick (“brown”) fox can’t jump 32.3 feet, right?&#39;</span><span style="color:#ABB2BF;">);</span></span>
<span class="line"><span style="color:#7F848E;">// -&gt; [&#39;The&#39;, &#39;quick&#39;, &#39;brown&#39;, &#39;fox&#39;, &#39;can’t&#39;, &#39;jump&#39;, &#39;32.3&#39;, &#39;feet&#39;, &#39;right&#39;]</span></span>
<span class="line"></span></code></pre></div><h2 id="i-want-more-control" tabindex="-1"><a class="header-anchor" href="#i-want-more-control" aria-hidden="true">#</a> I want more control</h2><p>Easy peasy! We can change our index also to support prefix matching and case-insensitive matching:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Post</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> title;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(type</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">IndexType</span><span style="color:#ABB2BF;">.value, caseSensitive</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">false</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  </span><span style="color:#E5C07B;">List</span><span style="color:#ABB2BF;">&lt;</span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;">&gt; </span><span style="color:#C678DD;">get</span><span style="color:#ABB2BF;"> </span><span style="color:#61AFEF;">titleWords</span><span style="color:#ABB2BF;"> =&gt; title.</span><span style="color:#61AFEF;">split</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39; &#39;</span><span style="color:#ABB2BF;">);</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><p>By default, Isar will store the words as hashed values which is fast and space efficient. But hashes can&#39;t be used for prefix matching. Using <code>IndexType.value</code>, we can change the index to use the words directly instead. It gives us the <code>.titleWordsAnyStartsWith()</code> where clause:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> posts </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.posts</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">titleWordsAnyStartsWith</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;hel&#39;</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">or</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">titleWordsAnyStartsWith</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;welco&#39;</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">or</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">titleWordsAnyStartsWith</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;howd&#39;</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">();</span></span>
<span class="line"></span></code></pre></div><h2 id="i-also-need-endswith" tabindex="-1"><a class="header-anchor" href="#i-also-need-endswith" aria-hidden="true">#</a> I also need <code>.endsWith()</code></h2><p>Sure thing! We will use a trick to achieve <code>.endsWith()</code> matching:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">class</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Post</span><span style="color:#ABB2BF;"> {</span></span>
<span class="line"><span style="color:#ABB2BF;">    </span><span style="color:#E5C07B;">Id</span><span style="color:#C678DD;">?</span><span style="color:#ABB2BF;"> id;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">    </span><span style="color:#C678DD;">late</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;"> title;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#ABB2BF;">    </span><span style="color:#C678DD;">@Index</span><span style="color:#ABB2BF;">(type</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">IndexType</span><span style="color:#ABB2BF;">.value, caseSensitive</span><span style="color:#C678DD;">:</span><span style="color:#ABB2BF;"> </span><span style="color:#D19A66;">false</span><span style="color:#ABB2BF;">)</span></span>
<span class="line"><span style="color:#ABB2BF;">    </span><span style="color:#E5C07B;">List</span><span style="color:#ABB2BF;">&lt;</span><span style="color:#E5C07B;">String</span><span style="color:#ABB2BF;">&gt; </span><span style="color:#C678DD;">get</span><span style="color:#ABB2BF;"> revTitleWords {</span></span>
<span class="line"><span style="color:#ABB2BF;">        </span><span style="color:#C678DD;">return</span><span style="color:#ABB2BF;"> </span><span style="color:#E5C07B;">Isar</span><span style="color:#ABB2BF;">.</span><span style="color:#61AFEF;">splitWords</span><span style="color:#ABB2BF;">(title).</span><span style="color:#61AFEF;">map</span><span style="color:#ABB2BF;">(</span></span>
<span class="line"><span style="color:#ABB2BF;">          (word) =&gt; word.reversed).</span><span style="color:#61AFEF;">toList</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">        );</span></span>
<span class="line"><span style="color:#ABB2BF;">    }</span></span>
<span class="line"><span style="color:#ABB2BF;">}</span></span>
<span class="line"></span></code></pre></div><p>Don&#39;t forget reversing the ending you want to search for:</p><div class="language-dart" data-ext="dart"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#C678DD;">final</span><span style="color:#ABB2BF;"> posts </span><span style="color:#56B6C2;">=</span><span style="color:#ABB2BF;"> </span><span style="color:#C678DD;">await</span><span style="color:#ABB2BF;"> isar.posts</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">where</span><span style="color:#ABB2BF;">()</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">revTitleWordsAnyStartsWith</span><span style="color:#ABB2BF;">(</span><span style="color:#98C379;">&#39;lcome&#39;</span><span style="color:#ABB2BF;">.reversed)</span></span>
<span class="line"><span style="color:#ABB2BF;">  .</span><span style="color:#61AFEF;">findAll</span><span style="color:#ABB2BF;">();</span></span>
<span class="line"></span></code></pre></div><h2 id="stemming-algorithms" tabindex="-1"><a class="header-anchor" href="#stemming-algorithms" aria-hidden="true">#</a> Stemming algorithms</h2><p>Unfortunately, indexes do not support <code>.contains()</code> matching (this is true for other databases as well). But there are a few alternatives that are worth exploring. The choice highly depends on your use. One example is indexing word stems instead of the whole word.</p><p>A stemming algorithm is a process of linguistic normalization in which the variant forms of a word are reduced to a common form:</p><div class="language-text" data-ext="text"><pre class="shiki" style="background-color:#282c34;"><code><span class="line"><span style="color:#abb2bf;">connection</span></span>
<span class="line"><span style="color:#abb2bf;">connections</span></span>
<span class="line"><span style="color:#abb2bf;">connective          ---&gt;   connect</span></span>
<span class="line"><span style="color:#abb2bf;">connected</span></span>
<span class="line"><span style="color:#abb2bf;">connecting</span></span>
<span class="line"><span style="color:#abb2bf;"></span></span></code></pre></div>`,15),h={href:"https://tartarus.org/martin/PorterStemmer/",target:"_blank",rel:"noopener noreferrer"},y={href:"https://snowballstem.org/algorithms/",target:"_blank",rel:"noopener noreferrer"},u={href:"https://en.wikipedia.org/wiki/Lemmatisation",target:"_blank",rel:"noopener noreferrer"},F=a("h2",{id:"phonetic-algorithms",tabindex:"-1"},[a("a",{class:"header-anchor",href:"#phonetic-algorithms","aria-hidden":"true"},"#"),s(" Phonetic algorithms")],-1),A={href:"https://en.wikipedia.org/wiki/Phonetic_algorithm",target:"_blank",rel:"noopener noreferrer"},g=a("div",{class:"custom-container warning"},[a("p",{class:"custom-container-title"},"Warning"),a("p",null,"Most phonetic algorithms only support a single language.")],-1),f=a("h3",{id:"soundex",tabindex:"-1"},[a("a",{class:"header-anchor",href:"#soundex","aria-hidden":"true"},"#"),s(" Soundex")],-1),m={href:"https://en.wikipedia.org/wiki/Soundex",target:"_blank",rel:"noopener noreferrer"},w=o('<p>Using this algorithm, both <code>&quot;Robert&quot;</code> and <code>&quot;Rupert&quot;</code> return the string <code>&quot;R163&quot;</code> while <code>&quot;Rubin&quot;</code> yields <code>&quot;R150&quot;</code>. <code>&quot;Ashcraft&quot;</code> and <code>&quot;Ashcroft&quot;</code> both yield <code>&quot;A261&quot;</code>.</p><h3 id="double-metaphone" tabindex="-1"><a class="header-anchor" href="#double-metaphone" aria-hidden="true">#</a> Double Metaphone</h3>',2),x={href:"https://en.wikipedia.org/wiki/Metaphone",target:"_blank",rel:"noopener noreferrer"},b=a("p",null,"Double Metaphone accounts for various irregularities in English of Slavic, Germanic, Celtic, Greek, French, Italian, Spanish, Chinese, and other origins.",-1);function C(v,D){const n=t("ExternalLinkIcon");return p(),r("div",null,[i,a("p",null,[s("The "),a("a",B,[s("Unicode Annex #29"),e(n)]),s(" defines how to split text into words correctly for almost all languages. It is quite complicated, but fortunately, Isar does the heavy lifting for us:")]),d,a("p",null,[s("Popular algorithms are the "),a("a",h,[s("Porter stemming algorithm"),e(n)]),s(" and the "),a("a",y,[s("Snowball stemming algorithms"),e(n)]),s(".")]),a("p",null,[s("There are also more advanced forms like "),a("a",u,[s("lemmatization"),e(n)]),s(".")]),F,a("p",null,[s("A "),a("a",A,[s("phonetic algorithm"),e(n)]),s(" is an algorithm for indexing words by their pronunciation. In other words, it allows you to find words that sound similar to the ones you are looking for.")]),g,f,a("p",null,[a("a",m,[s("Soundex"),e(n)]),s(" is a phonetic algorithm for indexing names by sound, as pronounced in English. The goal is for homophones to be encoded to the same representation so they can be matched despite minor differences in spelling. It is a straightforward algorithm, and there are multiple improved versions.")]),w,a("p",null,[s("The "),a("a",x,[s("Double Metaphone"),e(n)]),s(" phonetic encoding algorithm is the second generation of this algorithm. It makes several fundamental design improvements over the original Metaphone algorithm.")]),b])}const k=l(c,[["render",C],["__file","full_text_search.html.vue"]]);export{k as default};
