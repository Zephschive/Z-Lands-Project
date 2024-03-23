import React from "react";
import { Helmet } from "react-helmet";
import { Img, Heading, Input, Text } from "../../components";

export default function DesktopFivePage() {
  return (
    <>
      <Helmet>
        <title>ZLANDS</title>
        <meta name="description" content="Web site created using create-react-app" />
      </Helmet>
      <div className="w-full bg-gray-900_01">
        <div className="flex flex-col items-end">
          <header className="flex justify-between items-center w-[70%] mr-[146px]">
            <div className="h-[125px] w-[49%] relative">
              <Heading size="6xl" as="h1" className="bottom-0 left-0 m-auto !font-karla absolute">
                Review
              </Heading>
              <Text as="p" className="right-0 top-0 m-auto text-shadow-ts absolute">
                Z-LANDS
              </Text>
            </div>
            <div className="flex self-end justify-between w-[38%] gap-5">
              <a href="#" className="self-start mb-1 text-shadow-ts">
                <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla">
                  Dashboard{" "}
                </Heading>
              </a>
              <a href="#" className="self-end text-shadow-ts">
                <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla">
                  Validation
                </Heading>
              </a>
            </div>
          </header>
        </div>
        <div>
          <div className="h-[1942px] relative">
            <div className="flex flex-col md:flex-row sm:flex-col w-[14%] gap-[78px] left-[4%] top-[14%] m-auto absolute">
              <div className="flex flex-col bg-blue_gray-100 flex-1 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="ollennus"
                  className="h-[171px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-[41px] ml-1.5 gap-[22px]">
                    <Heading size="xl" as="h1" className="text-center">
                      ollennu’s residence
                    </Heading>
                    <div className="flex gap-3.5">
                      <Heading as="h2" className="self-start text-center">
                        Land Owner
                      </Heading>
                      <Heading as="h3" className="self-end text-center">
                        Zephaniah Ollennu
                      </Heading>
                    </div>
                    <div className="flex justify-between w-full gap-5 mx-auto md:p-5 max-w-[190px]">
                      <Heading as="h4" className="self-start text-center">
                        Location
                      </Heading>
                      <Heading as="h5" className="text-center">
                        Abokobi, Accra
                      </Heading>
                    </div>
                  </div>
                </div>
              </div>
              <div className="flex flex-col bg-blue_gray-100 flex-1 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="imageone_one"
                  className="h-[171px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-[41px] ml-1.5 gap-[22px]">
                    <Heading size="xl" as="h6" className="text-center">
                      ollennu’s residence
                    </Heading>
                    <div className="flex gap-3.5">
                      <Heading as="p" className="self-start text-center">
                        Land Owner
                      </Heading>
                      <Heading as="p" className="self-end text-center">
                        Zephaniah Ollennu
                      </Heading>
                    </div>
                    <div className="flex justify-between w-full gap-5 mx-auto md:p-5 max-w-[190px]">
                      <Heading as="p" className="self-start text-center">
                        Location
                      </Heading>
                      <Heading as="p" className="text-center">
                        Abokobi, Accra
                      </Heading>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className="flex flex-col md:flex-row sm:flex-col w-[14%] gap-[79px] top-[13%] right-0 left-0 m-auto absolute">
              <div className="flex flex-col bg-blue_gray-100 flex-1 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="ollennus"
                  className="h-[170px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-10 ml-1.5 gap-[22px]">
                    <Heading size="xl" as="h5" className="text-center">
                      ollennu’s residence
                    </Heading>
                    <div className="flex gap-3.5">
                      <Heading as="p" className="self-start text-center">
                        Land Owner
                      </Heading>
                      <Heading as="p" className="self-end text-center">
                        Zephaniah Ollennu
                      </Heading>
                    </div>
                    <div className="flex justify-between w-full gap-5 mx-auto md:p-5 max-w-[190px]">
                      <Heading as="p" className="self-start text-center">
                        Location
                      </Heading>
                      <Heading as="p" className="text-center">
                        Abokobi, Accra
                      </Heading>
                    </div>
                  </div>
                </div>
              </div>
              <div className="flex flex-col bg-blue_gray-100 flex-1 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="imageone_one"
                  className="h-[170px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-10 ml-1.5 gap-[22px]">
                    <Heading size="xl" as="h5" className="text-center">
                      ollennu’s residence
                    </Heading>
                    <div className="flex gap-3.5">
                      <Heading as="p" className="self-start text-center">
                        Land Owner
                      </Heading>
                      <Heading as="p" className="self-end text-center">
                        Zephaniah Ollennu
                      </Heading>
                    </div>
                    <div className="flex justify-between w-full gap-5 mx-auto md:p-5 max-w-[190px]">
                      <Heading as="p" className="self-start text-center">
                        Location
                      </Heading>
                      <Heading as="p" className="text-center">
                        Abokobi, Accra
                      </Heading>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className="flex md:flex-col items-start w-[76%] h-full ml-[67px] left-[4%] bottom-0 top-0 my-auto absolute">
              <div className="flex md:flex-col items-start z-[1] flex-1">
                <Heading size="5xl" as="h1" className="mt-[72px] !text-white-A700 !font-karla z-[1] text-shadow-ts">
                  Welcome To the Validation Page{" "}
                </Heading>
                <div className="flex sm:flex-col items-start ml-[-181px] flex-1">
                  <div className="w-[24%] sm:w-full mt-[271px] bg-blue_gray-100 rounded-[19px]">
                    <Img
                      src="images/img_image_1.png"
                      alt="imageone_one"
                      className="h-[165px] w-full rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                    />
                    <div className="p-[5px] bg-white-A700 rounded-[21px]">
                      <div className="flex flex-col mb-[39px] ml-1.5 gap-[21px]">
                        <Heading size="xl" as="h5" className="text-center">
                          ollennu’s residence
                        </Heading>
                        <div className="flex gap-3.5">
                          <Heading as="p" className="self-start text-center">
                            Land Owner
                          </Heading>
                          <Heading as="p" className="self-end text-center">
                            Zephaniah Ollennu
                          </Heading>
                        </div>
                        <div className="flex justify-between gap-5">
                          <Heading as="p" className="self-start text-center">
                            Location
                          </Heading>
                          <Heading as="p" className="text-center">
                            Abokobi, Accra
                          </Heading>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div className="flex flex-col ml-[-227px] p-[35px] sm:p-5 bg-white-A700 shadow-md flex-1">
                    <Heading size="4xl" as="h2" className="mt-[27px] ml-[19px] !font-karla">
                      Land Owner’s name:
                    </Heading>
                    <Heading size="4xl" as="h2" className="mt-[39px] ml-[19px] !font-karla">
                      Phone number:
                    </Heading>
                    <Heading size="4xl" as="h2" className="mt-[93px] ml-[19px] !font-karla">
                      Phone number:
                    </Heading>
                    <Input
                      color="blue_gray_100"
                      name="edittext"
                      className="w-[95%] mt-[35px] ml-[19px] sm:pr-5 rounded-[36px]"
                    />
                    <Heading size="4xl" as="h2" className="mt-[77px] ml-[19px] !font-karla">
                      Phone number:
                    </Heading>
                    <Input
                      color="blue_gray_100"
                      name="edittext_one"
                      className="w-[95%] mt-[35px] ml-[19px] sm:pr-5 rounded-[36px]"
                    />
                    <Heading size="4xl" as="h2" className="mt-[77px] ml-[19px] !font-karla">
                      Phone number:
                    </Heading>
                    <div className="h-[109px] w-[95%] mt-[34px] ml-[19px] bg-blue_gray-100 rounded-[36px]" />
                    <Heading size="4xl" as="h2" className="mt-[65px] ml-[19px] !font-karla">
                      Phone number:
                    </Heading>
                    <Input
                      color="blue_gray_100"
                      name="edittext_two"
                      className="w-[95%] mt-[34px] ml-[19px] sm:pr-5 rounded-[36px]"
                    />
                    <Heading size="4xl" as="h2" className="mt-[66px] ml-[19px] !font-karla">
                      Phone number:
                    </Heading>
                    <Input
                      color="blue_gray_100"
                      name="phoneNumber"
                      className="w-[95%] mt-7 ml-[19px] sm:pr-5 rounded-[36px]"
                    />
                    <div className="h-[86px] mt-[137px] mb-[202px] ml-[84px] relative">
                      <div className="h-[86px] w-[87%] left-0 bottom-0 top-0 my-auto bg-green-A400 absolute rounded-[14px]" />
                      <Heading
                        size="3xl"
                        as="h3"
                        className="w-[95%] bottom-[14%] right-0 m-auto !text-white-A700 !font-karla absolute"
                      >
                        Upload to Blockchain Network
                      </Heading>
                    </div>
                  </div>
                </div>
              </div>
              <div className="flex flex-col md:flex-row sm:flex-col w-[18%] md:w-full mt-[266px] ml-[-78px] gap-[83px]">
                <div className="flex flex-col bg-blue_gray-100 flex-1 rounded-[19px]">
                  <Img
                    src="images/img_image_1.png"
                    alt="ollennus"
                    className="h-[168px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                  />
                  <div className="p-[5px] bg-white-A700 rounded-[21px]">
                    <div className="flex flex-col mb-10 ml-1.5 gap-[21px]">
                      <Heading size="xl" as="h5" className="text-center">
                        ollennu’s residence
                      </Heading>
                      <div className="flex gap-3.5">
                        <Heading as="p" className="self-start text-center">
                          Land Owner
                        </Heading>
                        <Heading as="p" className="self-end text-center">
                          Zephaniah Ollennu
                        </Heading>
                      </div>
                      <div className="flex justify-between gap-5">
                        <Heading as="p" className="self-start text-center">
                          Location
                        </Heading>
                        <Heading as="p" className="text-center">
                          Abokobi, Accra
                        </Heading>
                      </div>
                    </div>
                  </div>
                </div>
                <div className="flex flex-col bg-blue_gray-100 flex-1 rounded-[19px]">
                  <Img
                    src="images/img_image_1.png"
                    alt="imageone_one"
                    className="h-[168px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                  />
                  <div className="p-[5px] bg-white-A700 rounded-[21px]">
                    <div className="flex flex-col mb-10 ml-1.5 gap-[21px]">
                      <Heading size="xl" as="h5" className="text-center">
                        ollennu’s residence
                      </Heading>
                      <div className="flex gap-3.5">
                        <Heading as="p" className="self-start text-center">
                          Land Owner
                        </Heading>
                        <Heading as="p" className="self-end text-center">
                          Zephaniah Ollennu
                        </Heading>
                      </div>
                      <div className="flex justify-between gap-5">
                        <Heading as="p" className="self-start text-center">
                          Location
                        </Heading>
                        <Heading as="p" className="text-center">
                          Abokobi, Accra
                        </Heading>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className="w-[18%] left-[24%] top-[36%] m-auto bg-blue_gray-100 absolute rounded-[19px]">
              <Img
                src="images/img_image_1.png"
                alt="imageone_three"
                className="h-[165px] w-full rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
              />
              <div className="p-[5px] bg-white-A700 rounded-[21px]">
                <div className="flex flex-col mb-[39px] ml-1.5 gap-[21px]">
                  <Heading size="xl" as="h5" className="text-center">
                    ollennu’s residence
                  </Heading>
                  <div className="flex gap-3.5">
                    <Heading as="p" className="self-start text-center">
                      Land Owner
                    </Heading>
                    <Heading as="p" className="self-end text-center">
                      Zephaniah Ollennu
                    </Heading>
                  </div>
                  <div className="flex justify-between w-full gap-5 mx-auto md:p-5 max-w-[190px]">
                    <Heading as="p" className="self-start text-center">
                      Location
                    </Heading>
                    <Heading as="p" className="text-center">
                      Abokobi, Accra
                    </Heading>
                  </div>
                </div>
              </div>
            </div>
            <div className="flex flex-col w-[15%] gap-[85px] right-[3%] top-[14%] m-auto absolute">
              <div className="flex flex-col w-full mx-auto md:p-5 bg-blue_gray-100 flex-1 max-w-[244px] rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="ollennus"
                  className="h-[168px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-10 ml-1.5 gap-[21px]">
                    <Heading size="xl" as="h5" className="text-center">
                      ollennu’s residence
                    </Heading>
                    <div className="flex gap-3.5">
                      <Heading as="p" className="self-start text-center">
                        Land Owner
                      </Heading>
                      <Heading as="p" className="self-end text-center">
                        Zephaniah Ollennu
                      </Heading>
                    </div>
                    <div className="flex justify-between gap-5">
                      <Heading as="p" className="self-start text-center">
                        Location
                      </Heading>
                      <Heading as="p" className="text-center">
                        Abokobi, Accra
                      </Heading>
                    </div>
                  </div>
                </div>
              </div>
              <div className="flex flex-col w-full mx-auto md:p-5 bg-blue_gray-100 flex-1 max-w-[244px] rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="imageone_one"
                  className="h-[168px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-10 ml-1.5 gap-[21px]">
                    <Heading size="xl" as="h5" className="text-center">
                      ollennu’s residence
                    </Heading>
                    <div className="flex gap-3.5">
                      <Heading as="p" className="self-start text-center">
                        Land Owner
                      </Heading>
                      <Heading as="p" className="self-end text-center">
                        Zephaniah Ollennu
                      </Heading>
                    </div>
                    <div className="flex justify-between gap-5">
                      <Heading as="p" className="self-start text-center">
                        Location
                      </Heading>
                      <Heading as="p" className="text-center">
                        Abokobi, Accra
                      </Heading>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <Heading
              size="5xl"
              as="h1"
              className="left-[4%] top-[9%] m-auto !text-white-A700 !font-karla text-shadow-ts absolute"
            >
              Select on any of the lands to review and upload to the blockchain network{" "}
            </Heading>
            <Img
              src="images/img_rectangle_18.png"
              alt="image"
              className="h-[1239px] w-full top-0 right-0 left-0 m-auto object-cover absolute"
            />
          </div>
        </div>
      </div>
    </>
  );
}
