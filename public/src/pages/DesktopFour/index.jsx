import React from "react";
import { Helmet } from "react-helmet";
import { Heading, Img, Text } from "../../components";

export default function DesktopFourPage() {
  return (
    <>
      <Helmet>
        <title>ZLANDS</title>
        <meta name="description" content="Web site created using create-react-app" />
      </Helmet>
      <div className="w-full pb-[61px] pl-14 pr-[61px] md:pb-5 md:px-5 bg-gray-900_01">
        <div className="flex flex-col items-end w-full mb-[26px] gap-[78px] mx-auto md:p-5 max-w-[1663px]">
          <div className="flex md:flex-col justify-between items-start w-[61%] md:w-full mr-[85px] gap-5">
            <Text as="p" className="mb-9 text-shadow-ts">
              Z-LANDS
            </Text>
            <div className="flex justify-between w-[45%] md:w-full mt-[74px] gap-5">
              <Heading size="5xl" as="h1" className="self-start mb-1 !text-white-A700 !font-karla text-shadow-ts">
                Dashboard{" "}
              </Heading>
              <Heading size="5xl" as="h2" className="self-end !text-white-A700 !font-karla text-shadow-ts">
                Validation
              </Heading>
            </div>
          </div>
          <div className="flex flex-col self-stretch items-start gap-[52px]">
            <Heading size="5xl" as="h2" className="!text-white-A700 !font-karla text-shadow-ts">
              Welcome To the Validation Page{" "}
            </Heading>
            <Heading size="5xl" as="h3" className="!text-white-A700 !font-karla text-shadow-ts">
              Select on any of the lands to review and upload to the blockchain network{" "}
            </Heading>
            <div className="gap-[460px] grid-cols-4 md:grid-cols-[1fr] grid">
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="ollennus"
                  className="h-[170px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-10 ml-1.5 gap-[22px]">
                    <Heading size="xl" as="h4" className="text-center">
                      ollennu’s residence
                    </Heading>
                    <div className="flex gap-3.5">
                      <Heading as="h5" className="self-start text-center">
                        Land Owner
                      </Heading>
                      <Heading as="h6" className="self-end text-center">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="imageone_one"
                  className="h-[171px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-[41px] ml-1.5 gap-[22px]">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="imageone_one"
                  className="h-[165px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="imageone_one"
                  className="h-[171px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
                />
                <div className="p-[5px] bg-white-A700 rounded-[21px]">
                  <div className="flex flex-col mb-[41px] ml-1.5 gap-[22px]">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
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
              <div className="flex flex-col w-full bg-blue_gray-100 rounded-[19px]">
                <Img
                  src="images/img_image_1.png"
                  alt="imageone_one"
                  className="h-[165px] rounded-tr-[19px] rounded-bl-[20px] rounded-tl-[19px] rounded-br-[20px] object-cover"
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
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
