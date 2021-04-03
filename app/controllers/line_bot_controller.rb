class LineBotController < ApplicationController
  protect_from_forgery except: [:callback]
  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      return head :bad_request
    end

    text_params = params["events"][0]["message"]["text"]
    
    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          if text_params == "からだ" then
                message = {
                            "type": "template",
                            "altText": "症状を調べています",
                            "template": {
                                "type": "buttons",
                                "thumbnailImageUrl": "https://3.bp.blogspot.com/-K-NrT9IVLT0/Wn1aAyKa-TI/AAAAAAABKRY/HScNXHJaf0EbKmHxL-_BQ_YbRI53tDxHACLcBGAs/s800/mask_animal_inu.png",
                                "imageAspectRatio": "rectangle",
                                "imageSize": "cover",
                                "imageBackgroundColor": "#FFFFFF",
                                "title": "あなたの症状はどれ？",
                                "text": "以下から選んでください①",
                                "defaultAction": {
                                    "type": "uri",
                                    "label": "View detail",
                                    "uri": "https://3.bp.blogspot.com/-K-NrT9IVLT0/Wn1aAyKa-TI/AAAAAAABKRY/HScNXHJaf0EbKmHxL-_BQ_YbRI53tDxHACLcBGAs/s800/mask_animal_inu.png"
                                },
                                "actions": [
                                    {
                                      "type": "message",
                                      "label": "風邪・発熱・頭痛",
                                      "text": "風邪・発熱・頭痛"
                                    },
                                    {
                                      "type": "message",
                                      "label": "胃腸・おしり（消化器）",
                                      "text": "胃腸・おしり（消化器）"
                                    },
                                    {
                                      "type": "message",
                                      "label": "肌のなやみ・虫刺され",
                                      "text": "肌のなやみ・虫刺され"
                                    },
                                    {
                                      "type": "message",
                                      "label": "目・耳・鼻・口",
                                      "text": "目・耳・鼻・口"
                                    }
                                ]
                            }
                          }
                          client.reply_message(event['replyToken'], message)
                        elsif text_params == "風邪・発熱・頭痛" then
                          message = {
                                    "type": "template",
                                    "altText": "症状を調べています",
                                    "template": {
                                        "type": "buttons",
                                        "thumbnailImageUrl": "https://2.bp.blogspot.com/-VkpbmU9niB0/WerLKOmHqtI/AAAAAAABHtI/TpV5ubTfbHUVIJCApRRaU0yTmDHhBXEgQCLcBGAs/s800/sick_byouketsu_man.png",
                                        "imageAspectRatio": "rectangle",
                                        "imageSize": "cover",
                                        "imageBackgroundColor": "#FFFFFF",
                                        "title": "あなたの症状はどれ？",
                                        "text": "以下から選んでください②",
                                        "defaultAction": {
                                            "type": "uri",
                                            "label": "View detail",
                                            "uri": "http://example.com/page/123"
                                        },
                                        "actions": [
                                            {
                                              "type": "message",
                                              "label": "風邪全般",
                                              "text": "風邪全般"
                                            },
                                            {
                                              "type": "message",
                                              "label": "咳（せき）",
                                              "text": "咳（せき）"
                                            },
                                            {
                                              "type": "message",
                                              "label": "のどの痛み",
                                              "text": "のどの痛み"
                                            },
                                            {
                                              "type": "message",
                                              "label": "頭痛",
                                              "text": "頭痛"
                                            }
                                        ]
                                    }
                                  }
                                  client.reply_message(event['replyToken'], message)
                                elsif text_params == "風邪全般" then
                                  message = {
                                            "type": "template",
                                            "altText": "検索結果を表示",
                                            "template": {
                                                "type": "buttons",
                                                "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                "imageAspectRatio": "rectangle",
                                                "imageSize": "cover",
                                                "imageBackgroundColor": "#FFFFFF",
                                                "title": "検索結果：こちらがおすすめ",
                                                "text": "効能/効果：風邪症状の緩和\n用法/用量：1日３回",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "http://example.com/page/123"
                                                },
                                                "actions": [
                                                    {
                                                      "type": "uri",
                                                      "label": "楽天市場で購入する",
                                                      "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                    }
                                                ]
                                            }
                                          }
                                          client.reply_message(event['replyToken'], message)
                                elsif text_params == "咳（せき）" then
                                  message = {
                                            "type": "template",
                                            "altText": "検索結果を表示",
                                            "template": {
                                                "type": "buttons",
                                                "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                "imageAspectRatio": "rectangle",
                                                "imageSize": "cover",
                                                "imageBackgroundColor": "#FFFFFF",
                                                "title": "検索結果：こちらがおすすめ",
                                                "text": "あなたの症状にはこちらのくすりがおすすめです１ー２",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "http://example.com/page/123"
                                                },
                                                "actions": [
                                                    {
                                                      "type": "uri",
                                                      "label": "楽天市場で購入する",
                                                      "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                    }
                                                ]
                                              }
                                            }
                                            client.reply_message(event['replyToken'], message)
                                elsif text_params == "のどの痛み" then
                                  message = {
                                            "type": "template",
                                            "altText": "症状を調べています",
                                            "template": {
                                                "type": "buttons",
                                                "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                "imageAspectRatio": "rectangle",
                                                "imageSize": "cover",
                                                "imageBackgroundColor": "#FFFFFF",
                                                "title": "検索結果",
                                                "text": "あなたの症状にはこちらのくすりがおすすめです１−３",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "http://example.com/page/123"
                                                },
                                                "actions": [
                                                    {
                                                      "type": "uri",
                                                      "label": "楽天市場で購入する",
                                                      "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                    }
                                                ]
                                              }
                                            }
                                            client.reply_message(event['replyToken'], message)
                                elsif text_params == "頭痛" then
                                  message = {
                                            "type": "template",
                                            "altText": "症状を調べています",
                                            "template": {
                                                "type": "buttons",
                                                "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                "imageAspectRatio": "rectangle",
                                                "imageSize": "cover",
                                                "imageBackgroundColor": "#FFFFFF",
                                                "title": "検索結果",
                                                "text": "あなたの症状にはこちらのくすりがおすすめです１−４",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "http://example.com/page/123"
                                                },
                                                "actions": [
                                                    {
                                                      "type": "uri",
                                                      "label": "楽天市場で購入する",
                                                      "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                    }
                                                ]
                                              }
                                            }
                                            client.reply_message(event['replyToken'], message)

                        elsif text_params == "胃腸・おしり（消化器）" then
                          message = {
                                  "type": "template",
                                  "altText": "症状を調べています",
                                  "template": {
                                      "type": "buttons",
                                                "thumbnailImageUrl": "https://example.com/bot/images/image.jpg",
                                      "imageAspectRatio": "rectangle",
                                      "imageSize": "cover",
                                      "imageBackgroundColor": "#FFFFFF",
                                        "title": "あなたの症状はどれ？",
                                        "text": "以下から選んでください②",
                                        "defaultAction": {
                                            "type": "uri",
                                                          "label": "View detail",
                                                          "uri": "http://example.com/page/123"
                                                      },
                                                      "actions": [
                                                          {
                                                            "type": "message",
                                                            "label": "胃痛",
                                                            "text": "胃痛"
                                                          },
                                                          {
                                                            "type": "message",
                                                            "label": "胃もたれ・胸やけ",
                                                            "text": "胃もたれ・胸やけ"
                                                          },
                                                          {
                                                            "type": "message",
                                                            "label": "便秘",
                                                            "text": "便秘"
                                                          },
                                                          {
                                                            "type": "message",
                                                            "label": "下痢",
                                                            "text": "下痢"
                                                          }
                                                      ]
                                                  }
                                                }
                                                client.reply_message(event['replyToken'], message)
                                              elsif text_params == "胃痛" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです２−１",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                          }
                                                        }
                                                        client.reply_message(event['replyToken'], message)
                                              elsif text_params == "胃もたれ・胸やけ" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです２ー２",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "便秘" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです２−３",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "下痢" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです２−４",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                        elsif text_params == "肌のなやみ・虫刺され" then
                          message = {
                                  "type": "template",
                                  "altText": "症状を調べています",
                                  "template": {
                                      "type": "buttons",
                                                "thumbnailImageUrl": "https://example.com/bot/images/image.jpg",
                                      "imageAspectRatio": "rectangle",
                                      "imageSize": "cover",
                                      "imageBackgroundColor": "#FFFFFF",
                                        "title": "あなたの症状はどれ？",
                                        "text": "以下から選んでください②",
                                        "defaultAction": {
                                            "type": "uri",
                                                          "label": "View detail",
                                                          "uri": "http://example.com/page/123"
                                                      },
                                                      "actions": [
                                                          {
                                                            "type": "message",
                                                            "label": "湿疹・皮膚炎",
                                                            "text": "湿疹・皮膚炎"
                                                          },
                                                          {
                                                            "type": "message",
                                                            "label": "虫刺され",
                                                            "text": "虫刺され"
                                                          },
                                                          {
                                                            "type": "message",
                                                            "label": "水虫",
                                                            "text": "水虫"
                                                          },
                                                          {
                                                            "type": "message",
                                                            "label": "やけど",
                                                            "text": "やけど"
                                                        }
                                                      ]
                                                  }
                                                }
                                                client.reply_message(event['replyToken'], message)
                                              elsif text_params == "湿疹・皮膚炎" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです３−１",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                          }
                                                        }
                                                        client.reply_message(event['replyToken'], message)
                                              elsif text_params == "虫刺され" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです３ー２",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "水虫" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです３−３",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "やけど" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "症状を調べています",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果",
                                                              "text": "あなたの症状にはこちらのくすりがおすすめです３−４",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                        elsif text_params == "目・耳・鼻・口" then
                          message = {
                                  "type": "template",
                                  "altText": "症状を調べています",
                                  "template": {
                                      "type": "buttons",
                                                "thumbnailImageUrl": "https://example.com/bot/images/image.jpg",
                                      "imageAspectRatio": "rectangle",
                                      "imageSize": "cover",
                                      "imageBackgroundColor": "#FFFFFF",
                                                  "title": "あなたの症状はどれ？",
                                                  "text": "以下から選んでください②",
                                                  "defaultAction": {
                                                      "type": "uri",
                                                                    "label": "View detail",
                                                                    "uri": "http://example.com/page/123"
                                                                },
                                                                "actions": [
                                                                    {
                                                                      "type": "message",
                                                                      "label": "目のかゆみ",
                                                                      "text": "目のかゆみ"
                                                                    },
                                                                    {
                                                                      "type": "message",
                                                                      "label": "鼻炎（花粉症）",
                                                                      "text": "鼻炎（花粉症）"
                                                                    },
                                                                    {
                                                                      "type": "message",
                                                                      "label": "口内炎",
                                                                      "text": "口内炎"
                                                                    },
                                                                    {
                                                                      "type": "message",
                                                                      "label": "歯が痛い",
                                                                      "text": "歯が痛い"
                                                                    }
                                                                ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                                        elsif text_params == "目のかゆみ" then
                                                          message = {
                                                                    "type": "template",
                                                                    "altText": "症状を調べています",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "cover",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果",
                                                                        "text": "あなたの症状にはこちらのくすりがおすすめです４−１",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "http://example.com/page/123"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                            }
                                                                        ]
                                                                    }
                                                                  }
                                                                  client.reply_message(event['replyToken'], message)
                                                        elsif text_params == "鼻炎（花粉症）" then
                                                          message = {
                                                                    "type": "template",
                                                                    "altText": "症状を調べています",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "cover",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果",
                                                                        "text": "あなたの症状にはこちらのくすりがおすすめです４ー２",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "http://example.com/page/123"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                            }
                                                                        ]
                                                                      }
                                                                    }
                                                                    client.reply_message(event['replyToken'], message)
                                                        elsif text_params == "口内炎" then
                                                          message = {
                                                                    "type": "template",
                                                                    "altText": "症状を調べています",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "cover",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果",
                                                                        "text": "あなたの症状にはこちらのくすりがおすすめです４−３",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "http://example.com/page/123"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                            }
                                                                        ]
                                                                      }
                                                                    }
                                                                    client.reply_message(event['replyToken'], message)
                                                        elsif text_params == "歯が痛い" then
                                                          message = {
                                                                    "type": "template",
                                                                    "altText": "症状を調べています",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "cover",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果",
                                                                        "text": "あなたの症状にはこちらのくすりがおすすめです３−４",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "http://example.com/page/123"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://biccamera.rakuten.co.jp/item/4987306046009/"
                                                                            }
                                                                        ]
                                                                      }
                                                                    }
                                                                    client.reply_message(event['replyToken'], message)
          else
              message = {
                type: 'text',
                text: "「からだ」と入力してください"
              }
              client.reply_message(event['replyToken'], message)
          end
        end
      end
    end
    head :ok
  end

  private
 
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
end
