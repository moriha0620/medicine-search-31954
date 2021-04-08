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
                                "imageSize": "contain",
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
                                        "imageSize": "contain",
                                        "imageBackgroundColor": "#FFFFFF",
                                        "title": "あなたの症状はどれ？",
                                        "text": "以下から選んでください②",
                                        "defaultAction": {
                                            "type": "uri",
                                            "label": "View detail",
                                            "uri": "https://2.bp.blogspot.com/-VkpbmU9niB0/WerLKOmHqtI/AAAAAAABHtI/TpV5ubTfbHUVIJCApRRaU0yTmDHhBXEgQCLcBGAs/s800/sick_byouketsu_man.png"
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
                                                "text": "効能/効果：風邪症状を鎮める\n用法/用量：1日３回",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/2962/00000003770564_a01.jpg"
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
                                                "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/0427/00000001608584_a01.jpg",
                                                "imageAspectRatio": "rectangle",
                                                "imageSize": "cover",
                                                "imageBackgroundColor": "#FFFFFF",
                                                "title": "検索結果：こちらがおすすめ",
                                                "text": "効能/効果：せき、たん\n用法/用量：1日２回（朝・夕）",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/0427/00000001608584_a01.jpg"
                                                },
                                                "actions": [
                                                    {
                                                      "type": "uri",
                                                      "label": "楽天市場で購入する",
                                                      "uri": "https://biccamera.rakuten.co.jp/item/4987107611956/"
                                                    }
                                                ]
                                              }
                                            }
                                            client.reply_message(event['replyToken'], message)
                                elsif text_params == "のどの痛み" then
                                  message = {
                                            "type": "template",
                                            "altText": "検索結果を表示",
                                            "template": {
                                                "type": "buttons",
                                                "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/0112/00000001422655_a01.jpg",
                                                "imageAspectRatio": "rectangle",
                                                "imageSize": "cover",
                                                "imageBackgroundColor": "#FFFFFF",
                                                "title": "検索結果：こちらがおすすめ",
                                                "text": "効能/効果：のどの痛み、発熱\n用法/用量：1日３回（食後）",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/0112/00000001422655_a01.jpg"
                                                },
                                                "actions": [
                                                    {
                                                      "type": "uri",
                                                      "label": "楽天市場で購入する",
                                                      "uri": "https://biccamera.rakuten.co.jp/item/4987300032015/"
                                                    }
                                                ]
                                              }
                                            }
                                            client.reply_message(event['replyToken'], message)
                                elsif text_params == "頭痛" then
                                  message = {
                                            "type": "template",
                                            "altText": "検索結果を表示",
                                            "template": {
                                                "type": "buttons",
                                                "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/5350/00000002009069_a01.jpg",
                                                "imageAspectRatio": "rectangle",
                                                "imageSize": "cover",
                                                "imageBackgroundColor": "#FFFFFF",
                                                "title": "検索結果：こちらがおすすめ",
                                                "text": "効能/効果：頭痛、生理痛、発熱\n用法/用量：1回２錠",
                                                "defaultAction": {
                                                    "type": "uri",
                                                    "label": "View detail",
                                                    "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/5350/00000002009069_a01.jpg"
                                                },
                                                "actions": [
                                                    {
                                                      "type": "uri",
                                                      "label": "楽天市場で購入する",
                                                      "uri": "https://biccamera.rakuten.co.jp/item/4903301190936/"
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
                                                "thumbnailImageUrl": "https://1.bp.blogspot.com/-JSeU_CYFWBU/UrEhirwecZI/AAAAAAAAb50/2ywfsXKPVYQ/s800/haraita_man.png",
                                      "imageAspectRatio": "rectangle",
                                      "imageSize": "contain",
                                      "imageBackgroundColor": "#FFFFFF",
                                        "title": "あなたの症状はどれ？",
                                        "text": "以下から選んでください②",
                                        "defaultAction": {
                                            "type": "uri",
                                                          "label": "View detail",
                                                          "uri": "https://1.bp.blogspot.com/-JSeU_CYFWBU/UrEhirwecZI/AAAAAAAAb50/2ywfsXKPVYQ/s800/haraita_man.png"
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
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/1210/00000002070568_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：胃痛、胃もたれ、胸やけ\n用法/用量：１回１錠、１日２回まで",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "http://example.com/page/123"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987107600042/"
                                                                  }
                                                              ]
                                                          }
                                                        }
                                                        client.reply_message(event['replyToken'], message)
                                              elsif text_params == "胃もたれ・胸やけ" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/5513/00000008088082_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：胃もたれ、胸やけ、食欲不振\n用法/用量：１回１錠",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/5513/00000008088082_a01.jpg"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987028114925/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "便秘" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/4271/00000006589311_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：便秘\n用法/用量：１回３〜６錠\n※用量は薬剤師へご相談ください",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/4271/00000006589311_a01.jpg"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987286316567/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "下痢" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/0742/00000001793533_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：下痢\n用法/用量：１回１錠、１日３回まで\n※水なしでも飲めます",
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
                                                "thumbnailImageUrl": "https://3.bp.blogspot.com/-e1fFAGLQaq4/UzAK7QZqsPI/AAAAAAAAea4/gepz0wMfmkQ/s800/biyou_tsurutsuru.png",
                                      "imageAspectRatio": "rectangle",
                                      "imageSize": "contain",
                                      "imageBackgroundColor": "#FFFFFF",
                                        "title": "あなたの症状はどれ？",
                                        "text": "以下から選んでください②",
                                        "defaultAction": {
                                            "type": "uri",
                                                          "label": "View detail",
                                                          "uri": "https://3.bp.blogspot.com/-e1fFAGLQaq4/UzAK7QZqsPI/AAAAAAAAea4/gepz0wMfmkQ/s800/biyou_tsurutsuru.png"
                                                      },
                                                      "actions": [
                                                          {
                                                            "type": "message",
                                                            "label": "湿疹・皮膚炎",
                                                            "text": "湿疹・皮膚炎"
                                                          },
                                                          {
                                                            "type": "message",
                                                            "label": "敏感肌・乾燥肌",
                                                            "text": "敏感肌・乾燥肌"
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
                                                        }
                                                      ]
                                                  }
                                                }
                                                client.reply_message(event['replyToken'], message)
                                              elsif text_params == "湿疹・皮膚炎" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/0427/00000001608604_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：湿疹、皮膚炎\n用法/用量：１日数回、適量を患部に塗ってください",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/0427/00000001608604_a01.jpg"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987128154258/"
                                                                  }
                                                              ]
                                                          }
                                                        }
                                                        client.reply_message(event['replyToken'], message)
                                              elsif text_params == "敏感肌・乾燥肌" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://tshop.r10s.jp/rakuten24/cabinet/105/4987074300105.jpg?downsize=500:*",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：乾燥肌、手指の荒れ\n用法/用量：１日数回、適量を患部に塗ってください",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "https://tshop.r10s.jp/rakuten24/cabinet/105/4987074300105.jpg?downsize=500:*"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://item.rakuten.co.jp/rakuten24/e259359h/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "虫刺され" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/1214/00000002072479_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：虫刺され、かゆみ\n用法/用量：１日数回、適量を患部に塗ってください",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/1214/00000002072479_a01.jpg"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987426002138/"
                                                                  }
                                                              ]
                                                            }
                                                          }
                                                          client.reply_message(event['replyToken'], message)
                                              elsif text_params == "水虫" then
                                                message = {
                                                          "type": "template",
                                                          "altText": "検索結果を表示",
                                                          "template": {
                                                              "type": "buttons",
                                                              "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/0742/00000001793654_a01.jpg",
                                                              "imageAspectRatio": "rectangle",
                                                              "imageSize": "cover",
                                                              "imageBackgroundColor": "#FFFFFF",
                                                              "title": "検索結果：こちらがおすすめ",
                                                              "text": "効能/効果：水虫、いんきんたむし、ほか\n用法/用量：１日１回、適量を患部に塗ってください",
                                                              "defaultAction": {
                                                                  "type": "uri",
                                                                  "label": "View detail",
                                                                  "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/0742/00000001793654_a01.jpg"
                                                              },
                                                              "actions": [
                                                                  {
                                                                    "type": "uri",
                                                                    "label": "楽天市場で購入する",
                                                                    "uri": "https://biccamera.rakuten.co.jp/item/4987107612212/"
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
                                                "thumbnailImageUrl": "https://1.bp.blogspot.com/-h8J7BrQ2bZ0/Xw6KK7stFrI/AAAAAAABaGo/FRn0mrsMcD4AdGoIO1qWdREjZ8gBhGsVgCNcBGAsYHQ/s180-c/thumbnail_sick_itai_man.jpg",
                                      "imageAspectRatio": "rectangle",
                                      "imageSize": "contain",
                                      "imageBackgroundColor": "#FFFFFF",
                                                  "title": "あなたの症状はどれ？",
                                                  "text": "以下から選んでください②",
                                                  "defaultAction": {
                                                      "type": "uri",
                                                                    "label": "View detail",
                                                                    "uri": "https://1.bp.blogspot.com/-h8J7BrQ2bZ0/Xw6KK7stFrI/AAAAAAABaGo/FRn0mrsMcD4AdGoIO1qWdREjZ8gBhGsVgCNcBGAsYHQ/s180-c/thumbnail_sick_itai_man.jpg"
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
                                                                    "altText": "検索結果を表示",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/1450/00000003032653_a01.jpg",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "cover",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果：こちらがおすすめ",
                                                                        "text": "効能/効果：目のかゆみ、充血\n用法/用量：１回１～２滴、１日４～６回点眼してください",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/1450/00000003032653_a01.jpg"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://biccamera.rakuten.co.jp/item/4987107615619/"
                                                                            }
                                                                        ]
                                                                    }
                                                                  }
                                                                  client.reply_message(event['replyToken'], message)
                                                        elsif text_params == "鼻炎（花粉症）" then
                                                          message = {
                                                                    "type": "template",
                                                                    "altText": "検索結果を表示",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://thumbnail.image.rakuten.co.jp/@0_mall/tsuruha/cabinet/shouhin30/4987107615640.jpg?_ex=200x200&s=0&r=1",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "contain",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果",
                                                                        "text": "効能/効果：くしゃみ、鼻水\n用法/用量：１回１度ずつ、両鼻腔内に噴霧してください",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "https://thumbnail.image.rakuten.co.jp/@0_mall/tsuruha/cabinet/shouhin30/4987107615640.jpg?_ex=200x200&s=0&r=1"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://item.rakuten.co.jp/tsuruha/10087545/"
                                                                            }
                                                                        ]
                                                                      }
                                                                    }
                                                                    client.reply_message(event['replyToken'], message)
                                                        elsif text_params == "口内炎" then
                                                          message = {
                                                                    "type": "template",
                                                                    "altText": "検索結果を表示",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://image.rakuten.co.jp/biccamera/cabinet/product/1453/00000003035374_a01.jpg",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "cover",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果",
                                                                        "text": "効能/効果：口内炎、舌炎\n用法/用量：１日２〜４回、患部を清浄後、塗ってください",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "https://image.rakuten.co.jp/biccamera/cabinet/product/1453/00000003035374_a01.jpg"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://biccamera.rakuten.co.jp/item/4987107614001/"
                                                                            }
                                                                        ]
                                                                      }
                                                                    }
                                                                    client.reply_message(event['replyToken'], message)
                                                        elsif text_params == "歯が痛い" then
                                                          message = {
                                                                    "type": "template",
                                                                    "altText": "検索結果を表示",
                                                                    "template": {
                                                                        "type": "buttons",
                                                                        "thumbnailImageUrl": "https://thumbnail.image.rakuten.co.jp/@0_mall/megadrug/cabinet/05527406/imgrc0066095831.jpg?_ex=200x200&s=0&r=1",
                                                                        "imageAspectRatio": "rectangle",
                                                                        "imageSize": "cover",
                                                                        "imageBackgroundColor": "#FFFFFF",
                                                                        "title": "検索結果",
                                                                        "text": "効能/効果：歯痛・抜歯後の疼痛\n用法/用量：１回１錠、１日２回まで",
                                                                        "defaultAction": {
                                                                            "type": "uri",
                                                                            "label": "View detail",
                                                                            "uri": "https://thumbnail.image.rakuten.co.jp/@0_mall/megadrug/cabinet/05527406/imgrc0066095831.jpg?_ex=200x200&s=0&r=1"
                                                                        },
                                                                        "actions": [
                                                                            {
                                                                              "type": "uri",
                                                                              "label": "楽天市場で購入する",
                                                                              "uri": "https://item.rakuten.co.jp/drugwakuwaku/wakuwaku_30116/"
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
