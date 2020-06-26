# Dot - Reference

Ink 的最基本组成单位，也是引用的基本组成单元。由 Dot、DotType 和 DotSpace 组成。其中，Dot 和 DotType 属于包含了公共属性对象，具体的能力由继承了 DotSpace 的类来实现。

{% tabs %}
{% tab title="Dot" %}
```java
@Entity
@Table(name = "t_dot")
public class Dot {
  @Id
  private String id;

  private DotType type;

  private DotSpace space;
  private String spaceId;
  private Object spaceContent;

  private Date cTime;
  private Date uTime;
}

```
{% endtab %}

{% tab title="DotSpace" %}
```java
public abstract class DotSpace {
  @Id
  protected String id;
  protected DotType.DotTypeEnum type;
  
  protected Map<String, Object> space;
}
```
{% endtab %}
{% endtabs %}

## 类型

Dot 的主要类型有：

* 文本类型 TEXT
* 资源类型 RESOURCE
  * 图片 PICTURE
  * 音频 AUDIO
  * 视频 VIDEO
  * 文件 BINARY（二进制） & TEXT（文本）
* 引用类型 REFERENCE
  * 站内资源
    * Dot，Dot 本身可通过 Symbols 被引用：symbols.dot\[s\].reference-content
  * 站外资源
    * 图片
    * 第三方嵌入，如 Bilibili、优酷视频、网易云音乐等。
* 混合类型 COMBINATION
  * 混合结构

